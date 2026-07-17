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
    brace_depth = 0
    paren_depth = 0
    stmt_start = None
    for i, (kind, text, pos) in enumerate(tokens): # type: ignore
        if text == '{':
            brace_depth += 1
            stmt_start = None   # force re-seed on the *next* token, not this one
            continue
        elif text == '}':
            brace_depth -= 1
            stmt_start = None
            continue
        elif text in ('(', '['):
            paren_depth += 1
        elif text in (')', ']'):
            paren_depth -= 1
        elif text == ';' and paren_depth == 0 and brace_depth >= 1:
            if stmt_start is not None:
                yield (stmt_start, i)
            stmt_start = i + 1
            continue
        if stmt_start is None and brace_depth >= 1:
            stmt_start = i


def expression_converter(tokens: List[str]) -> str:
    print(f"Converting: {tokens}")
    return " ".join(tokens)


"""
Declaration ✓
Assignment ✓ 
    Ternary 
    Add brackets to literals
Compound (+=)
    a += b -> a = a + b
    a -= b -> a = a - b
    a++ -> a = a + 1
    a-- -> a = a - 1
Return ✓
Raw function calls
    Containing int_enc
    Inside expressions
Struct access
Multi-initializations

Variable scope handling
"""

ints: List[str] = []
int_encs: List[str] = []

def converter(str_in: str, tokens: List[Token]) -> str:
    converted_str = str_in
    expression = ""

    print(f"{str_in} === {tokens}")
    first_token = tokens[0][1]

    if first_token == "int_enc":
        if len(tokens) < 3:
            # int_enc declaration
            int_encs.append(tokens[1][1])
        else:
            # int_enc initialization
            expression = expression_converter([token[1] for token in tokens[1:len(tokens)]])
            converted_str = f"{tokens[0][1]} = {expression}"
    elif first_token == "int":
        # int declaration
        ints.append(tokens[1][1])
    elif first_token == "return":
        # return statement
        if len(tokens) > 1:
            expression = expression_converter([token[1] for token in tokens[1:len(tokens)]])
        converted_str = f"return {expression}"
    elif first_token in int_encs:
        # int_enc assignment
        if len(tokens) > 2:
            expression = expression_converter([token[1] for token in tokens[1:len(tokens)]])
        converted_str = f"{tokens[0][1]} = {expression}"

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