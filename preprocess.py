import sys
import re
from typing import List, Tuple, Iterator, Dict, Optional


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
Declaration
Assignment
    Ternary 
    Add brackets to literals
Compound (+=)
    a += b -> a = a + b
    a -= b -> a = a - b
    a++ -> a = a + 1
    a-- -> a = a - 1
Return
Raw function calls
    Containing int_enc
    Inside expressions
Struct access
Arrays
Variable scope handling

Don't like these:
Multi-declarations
Multi-initializations
"""
# Each scope is identified by a unique int. scope_parent[s] = the scope
# that directly encloses s (or None for the global/file scope).
scope_parent: Dict[int, Optional[int]] = {0: None}   # 0 = global scope
next_scope_id = 1

# type, name, and the scope it was declared in
identifiers: List[Tuple[str, str, int]] = []


def log_identifiers(tokens: List[Token], scope: int) -> None:
    return


def rewrite_line(tokens: List[Token], scope: int) -> str:
    return ""


def compute_scopes(tokens: List[Token]) -> List[int]:
    """
    Returns a list the same length as tokens, where scope_at[i] is the
    scope ID that tokens[i] lexically belongs to. Also populates the
    module-level scope_parent dict as a side effect.
    """
    global next_scope_id
    scope_at: List[int] = []
    scope_stack: List[int] = [0]   # start in global scope (id 0)

    for _, text, _ in tokens:
        if text == '{':
            new_scope = next_scope_id
            next_scope_id += 1
            scope_parent[new_scope] = scope_stack[-1]
            scope_stack.append(new_scope)
            scope_at.append(new_scope)   # the '{' itself belongs to the new scope
            continue
        elif text == '}':
            scope_at.append(scope_stack[-1])  # '}' belongs to the scope it's closing
            if len(scope_stack) > 1:
                scope_stack.pop()
            continue
        scope_at.append(scope_stack[-1])

    return scope_at


def lookup_identifier(name: str, scope: int) -> Optional[str]:
    """Returns the declared type of `name` as visible from `scope`,
    searching outward through enclosing scopes (innermost-first — this
    is what makes shadowing work: an inner declaration is found before
    an outer one with the same name)."""
    s: Optional[int] = scope
    while s is not None:
        for typ, nm, decl_scope in identifiers:
            if nm == name and decl_scope == s:
                return typ
        s = scope_parent.get(s)
    return None


def main(pre_file: str, processed_file: str) -> None:
    src: str = open(pre_file).read()
    tokens: List[Token] = tokenize(src)
    scope_at: List[int] = compute_scopes(tokens)
    spans = list(find_statement_spans(tokens))

    for start_idx, end_idx in spans:
        stmt_tokens = tokens[start_idx:end_idx]
        if not stmt_tokens:
            continue
        scope = scope_at[start_idx]
        log_identifiers(stmt_tokens, scope)

    out_parts: List[str] = []
    cursor = 0
    for start_idx, end_idx in spans:
        stmt_tokens = tokens[start_idx:end_idx]
        if not stmt_tokens:
            continue
        stmt_start_pos = stmt_tokens[0][2]
        last_tok = stmt_tokens[-1]
        stmt_end_pos = last_tok[2] + len(last_tok[1])
        out_parts.append(src[cursor:stmt_start_pos])
        scope = scope_at[start_idx]
        rewritten = rewrite_line(stmt_tokens, scope)
        out_parts.append(rewritten)
        cursor = stmt_end_pos
    out_parts.append(src[cursor:])

    with open(processed_file, "w") as f:
        f.write("".join(out_parts))


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python3 preprocess.py <input_file> <output_file>")
        sys.exit(1)

    main(sys.argv[1], sys.argv[2])