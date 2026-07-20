import sys
import re
from typing import List, Tuple, Iterator


# leading_whitespace = re.match(r"^\s*", unstripped_line).group(0) # type: ignore

# A Token is (kind: str, text: str, pos: int)
#   kind = one of: 'ident', 'number', 'string', 'char', 'punct'
#          (comment/preproc tokens are matched but discarded, never returned)
#   text = the exact substring matched, e.g. 'x', '+', '"hello"', '123'
#   pos  = character offset into the original src string where this token starts
Token = Tuple[str, str, int]

# A Span is (start_idx, end_idx): both are indices INTO the tokens list
# (not character offsets), marking a half-open... actually here end_idx
# points AT the terminating ';' token itself (inclusive endpoint,
# exclusive of the ';' when you slice — see usage note below).
Span = Tuple[int, int]


TOKEN_RE = re.compile(r'''
    (?P<comment_ml>/\*.*?\*/)              |
    (?P<comment_sl>//[^\n]*)               |
    (?P<string>"(?:\\.|[^"\\])*")          |
    (?P<char>'(?:\\.|[^'\\])*')            |
    (?P<preproc>^\#[^\n]*)                 |
    (?P<hex>0[xX][0-9a-fA-F]+[uUlL]*)      |
    (?P<bin>0[bB][01]+[uUlL]*)             |
    (?P<float>\d+\.\d+[fF]?)               |
    (?P<oct>0[0-7]+[uUlL]*)                |
    (?P<dec>\d+[uUlL]*)                    |
    (?P<ident>[A-Za-z_]\w*)                |
    (?P<punct>==|!=|<=|>=|&&|\|\||\+\+|--|->|[{}()\[\];,=+\-*/%<>!&|^~])
''', re.VERBOSE | re.MULTILINE)

def tokenize(src: str) -> List[Token]:
    """
    Input:
        src: str — the full contents of a .c file, read as one string
             (e.g. via open(path).read()). NOT pre-split into lines.

    Output:
        List[Token] — a flat, ordered list of (kind, text, pos) tuples,
        one per token found in src, in the order they appear.
        Comments and preprocessor directive lines are silently dropped
        (never appear in the returned list) — they are matched by the
        regex only so they get *skipped* correctly rather than being
        misread as code.

    Example:
        tokenize("result = x + y;")
        ->
        [
            ('ident',  'result', 0),
            ('punct',  '=',      7),
            ('ident',  'x',      9),
            ('punct',  '+',      11),
            ('ident',  'y',      13),
            ('punct',  ';',      14),
        ]
    """
    tokens: List[Token] = []
    for m in TOKEN_RE.finditer(src):
        kind = m.lastgroup
        if kind in ('comment_ml', 'comment_sl', 'preproc'):
            continue
        tokens.append((kind, m.group(), m.start())) # type: ignore
    return tokens


def find_statement_spans(tokens: List[Token]) -> Iterator[Span]:
    """
    Input:
        tokens: List[Token] — the full token list for one file, as
                produced by tokenize() above. This function does NOT
                take a string; it takes the already-tokenized list.

    Output:
        Iterator[Span] — yields one (start_idx, end_idx) pair per
        ';'-terminated statement found inside a function body
        (brace_depth >= 1), where the ';' itself is at paren_depth 0.
        start_idx and end_idx are both indices into the `tokens` list
        (e.g. tokens[start_idx] is the first token of the statement,
        tokens[end_idx] is the ';' token that ends it).

        To get just the expression tokens (no trailing ';'), slice:
            tokens[start_idx:end_idx]

    Example:
        tokens = tokenize("void f() { result = x + y; }")
        list(find_statement_spans(tokens))
        -> [(6, 11)]   # tokens[6:11] == ['result','=','x','+','y'], tokens[11] == ';'
    """
    block_depth = 0
    paren_depth = 0
    stmt_start = None
    brace_kind_stack: List[str] = []   # 'block' or 'init', one entry per open '{'
    prev_text = None

    for i, (_, text, _) in enumerate(tokens):
        if text == '{':
            is_block_open = prev_text in (')', 'else', 'do', None)
            if is_block_open:
                brace_kind_stack.append('block')
                block_depth += 1
                stmt_start = None
            else:
                brace_kind_stack.append('init')
                # initializer brace: do NOT reset stmt_start, do NOT touch block_depth
            prev_text = text
            continue

        elif text == '}':
            closed_kind = brace_kind_stack.pop() if brace_kind_stack else 'block'
            if closed_kind == 'block':
                block_depth -= 1
                stmt_start = None
            # else: closing an initializer '}' — statement continues normally
            prev_text = text
            continue

        elif text in ('(', '['):
            paren_depth += 1
        elif text in (')', ']'):
            paren_depth -= 1
        elif text == ';' and paren_depth == 0 and block_depth >= 1:
            if stmt_start is not None:
                yield (stmt_start, i)
            stmt_start = i + 1
            prev_text = text
            continue

        if stmt_start is None and block_depth >= 1:
            stmt_start = i
        prev_text = text


CONTROL_KEYWORDS = {"if", "while", "for", "switch", "sizeof"}
# In-Stack Precedence (ISP) Dictionary
ISP = { # type: ignore
    ")": None,  # Never pushed to the stack
    "=": 1, "+=": 1, "-=": 1, "*=": 1, "/=": 1, "%=": 1,
    "||": 3,
    "&&": 4,
    "|": 5,
    "^": 6,
    "&": 7,
    "==": 8, "!=": 8,
    "<": 9, "<=": 9, ">": 9, ">=": 9,
    "<<": 10, ">>": 10,
    "+": 11, "-": 11,
    "*": 12, "/": 12, "%": 12,
    "++": 13, "--": 13, "!": 13, "~": 13,
    "(": 0
}
# Incoming Precedence (ICP) Dictionary
ICP = {
    ")": 0,
    "=": 2, "+=": 2, "-=": 2, "*=": 2, "/=": 2, "%=": 2,
    "||": 3,
    "&&": 4,
    "|": 5,
    "^": 6,
    "&": 7,
    "==": 8, "!=": 8,
    "<": 9, "<=": 9, ">": 9, ">=": 9,
    "<<": 10, ">>": 10,
    "+": 11, "-": 11,
    "*": 12, "/": 12, "%": 12,
    "++": 14, "--": 14, "!": 14, "~": 14,
    "(": 15
}


def is_str_integer(val: str):
    try:
        int(val)
        return True
    except ValueError:
        return False


OP_LOOKUP = {
    "+": "add",
    "<": "slt",
    "^": "xor",
    "|": "or",
    "&": "and",
    "<<": "sll",
    ">>": "srr",
    "-": "sub",

}


def getFunctionStr(num1: str, num2: str, op: str) -> str:
    num1_is_imm = is_str_integer(num1)
    num2_is_imm = is_str_integer(num2)

    if num1_is_imm and num2_is_imm:
        return str(eval(f"{num1} {op} {num2}"))
    elif num1_is_imm:
        pass
    elif num2_is_imm:
        pass
    else:
        pass

    return ""


def convert_expression(tokens: List[Token]) -> str:
    tokens_strs = [token[1] for token in tokens]

    print(f"Converting {" ".join(tokens_strs)}")

    contains_only_literals = True

    for token in tokens:
        if token[0] == "ident":
            contains_only_literals = False
            break

    if contains_only_literals:
        return f"{{{" ".join(tokens_strs)}}}"

    opStack: List[str] = []
    postfix = ""

    for token in tokens:
        if token[0] == "punct":
            op = token[1]

            if op == ")":
                while opStack and not opStack[0] == "(":
                    postfix += f"{opStack.pop(0)} "
                if opStack[0] == "(":
                    opStack.pop(0)
            else:
                while opStack and ICP[op] <= ISP[opStack[0]]: # type: ignore
                    postfix += f"{opStack.pop(0)} "
                opStack.insert(0, op)
        else:
            postfix += f"{token[1]} "
    
    while opStack:
        postfix += f"{opStack.pop(0)} "

    postfix = postfix.rstrip()
    print(f"Postfix: {postfix}")

    # Postfix to function calls
    postfix_list = postfix.split()
    operands: List[str] = []

    for token in postfix_list:
        if token in ICP:
            operands.insert(0, f"{getFunctionStr(operands.pop(0), operands.pop(0), token)}")

    return postfix.rstrip()


"""
Declaration ✓
Assignment ✓ 
    Ternary 
    Add brackets to literals ✓
Compound (+=) ✓
    a += b -> a = a + b
    a -= b -> a = a - b
    a++ -> a = a + 1
    a-- -> a = a - 1
Return ✓
Raw function calls
    Containing int_enc
    Inside expressions
Struct access
Arrays ✓

Variable scope handling
Don't like these:
Multi-declarations
Multi-initializations
"""

ints: List[str] = []
int_encs: List[str] = []
int_enc_arrays: List[str] = []

def converter(str_in: str, tokens: List[Token]) -> str:
    converted_str = str_in
    expression = ""

    #print(f"{str_in} === {tokens}\n")
    first_token = tokens[0][1]

    if first_token == "int_enc":
        if len(tokens) < 3:
            # int_enc declaration
            int_encs.append(tokens[1][1])
        elif tokens[2][1] == "[":
            # int_enc array
            int_enc_arrays.append(tokens[1][1])
            if len(tokens) < 6:
                # int_enc array declaration
                pass
            else:
                # int_enc array initialization
                converted_str = f"int_enc {tokens[1][1]}[{tokens[3][1]}] = {{"
                for i, element_token in enumerate(tokens[7:len(tokens) - 1:2]):
                    if i != 0:
                        converted_str += ", "
                    element_token_as_list = [element_token] # Done so that it can be passed to the converter easily
                    converted_str += f"{convert_expression(element_token_as_list)}"
                converted_str += "}"
        elif tokens[2][1] == ",":
            # Multi-declaration
            pass
        else:
            # int_enc initialization
            int_encs.append(tokens[1][1])
            expression = convert_expression([token for token in tokens[3:len(tokens)]])
            converted_str = f"int_enc {tokens[1][1]} = {expression}"
    elif first_token == "int":
        # int declaration
        ints.append(tokens[1][1])
    elif first_token == "return":
        # return statement
        if len(tokens) > 1 and any(any(s in t[1] for s in int_encs) for t in tokens):
            # int_enc being returned
            expression = convert_expression([token for token in tokens[1:len(tokens)]])
            converted_str = f"return {expression}"
    elif first_token in int_encs:
        # int_enc assignment
        if len(tokens) > 2:
            if tokens[1][1] != "=":
                # Augmented assignment operator
                expression = convert_expression([tokens[0], (tokens[1]), ('punct', '(', -1)] + [token for token in tokens[3:len(tokens)]] + [('punct', ')', -1)])
            else:
                # Normal assignment
                expression = convert_expression([token for token in tokens[2:len(tokens)]])
            converted_str = f"{tokens[0][1]} = {expression}"
        elif len(tokens) > 1 and (tokens[1][1] == "++" or tokens[1][1] == "--"):
            # Unary assignment
            converted_str = f"{tokens[0][1]} = {convert_expression([(tokens[0]), ('punct', tokens[1][1][0], -1), ('dec', '1', -1)])}"
    return converted_str


def main(pre_file: str, processed_file: str) -> None:
    """
    Takes a normal .c file that uses int_enc, and injects the correct function call in place of the operation., also ensure encrypted values stay hidden.
    """
    src: str = open(pre_file).read()          # str  -> whole file contents
    tokens: List[Token] = tokenize(src)        # str  -> List[Token]
    spans: Iterator[Span] = find_statement_spans(tokens)   # List[Token] -> Iterator[(int, int)]

    # Build the output by copying src verbatim, except inside statement spans
    # we care about, where we substitute the converted text.
    out_parts: List[str] = []
    cursor = 0  # character position in src we've copied up to

    for start_idx, end_idx in spans:
        stmt_tokens = tokens[start_idx:end_idx]
        if not stmt_tokens:
            continue

        stmt_start_pos = stmt_tokens[0][2]          # char pos of first token
        last_tok = stmt_tokens[-1]
        stmt_end_pos = last_tok[2] + len(last_tok[1])  # char pos just after last token

        # Copy everything from cursor up to the start of this statement verbatim
        out_parts.append(src[cursor:stmt_start_pos])

        # Convert just this statement's text
        original_stmt_text = src[stmt_start_pos:stmt_end_pos]
        rewritten = converter(original_stmt_text, stmt_tokens)
        out_parts.append(rewritten)

        cursor = stmt_end_pos

    # Copy whatever's left after the last statement (closing braces, etc.)
    out_parts.append(src[cursor:])

    with open(processed_file, "w") as f:
        f.write("".join(out_parts))

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python3 preprocess.py <input_file> <output_file>")
        sys.exit(1)

    main(sys.argv[1], sys.argv[2])