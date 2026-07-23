import sys
import re
from typing import List, Tuple, Iterator, Dict, Optional


# A Token is (kind: str, text: str, pos: int)
#   kind = one of: 'ident', 'number', 'string', 'char', 'punct'
#          (comment/preproc tokens are matched but discarded, never returned)
#   text = the exact substring matched, e.g. 'x', '+', '"hello"', '123'
#   pos  = character offset into the original src string where this token starts
Token = Tuple[str, str, int]

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
        if kind in ('hex', 'bin', 'oct', 'dec', 'float'):
            kind = 'literal'   # collapse all numeric-literal variants into one label
        tokens.append((kind, m.group(), m.start())) # type: ignore
    return tokens


# A Span is (start_idx, end_idx, kind), kind is 'stmt' or 'header'.
#   'stmt'   -> a ';'-terminated statement/declaration (as before)
#   'header' -> a function signature or if/while/for/switch condition,
#               i.e. everything up to (not including) the '{' that opens
#               a block
Span = Tuple[int, int, str]

def find_statement_spans(tokens: List[Token]) -> Iterator[Span]:
    paren_depth = 0
    stmt_start = None
    brace_kind_stack: List[str] = []
    prev_text = None

    for i, (_, text, _) in enumerate(tokens):
        if text == '{':
            is_block_open = prev_text in (')', 'else', 'do', None)
            if is_block_open:
                if stmt_start is not None:
                    yield (stmt_start, i, 'header')
                brace_kind_stack.append('block')
                stmt_start = None
            else:
                brace_kind_stack.append('init')
            prev_text = text
            continue

        elif text == '}':
            closed_kind = brace_kind_stack.pop() if brace_kind_stack else 'block'
            if closed_kind == 'block':
                stmt_start = None
            prev_text = text
            continue

        elif text in ('(', '['):
            paren_depth += 1
        elif text in (')', ']'):
            paren_depth -= 1
        elif text == ';' and paren_depth == 0:
            if stmt_start is not None:
                yield (stmt_start, i, 'stmt')
            stmt_start = i + 1
            prev_text = text
            continue

        if stmt_start is None:
            stmt_start = i
        prev_text = text


def find_paren_contents(tokens: List[Token], start_idx: int, end_idx: int) -> Optional[Tuple[int, int]]:
    """
    Given a 'header' span's (start_idx, end_idx), finds the first '(' in
    that range and its matching ')'. Returns (inner_start, inner_end) —
    token indices for the content strictly between them (i.e. tokens[inner_start:inner_end]
    is everything inside the parens, no parens included).
    Returns None if there's no '(' in the span (e.g. a bare "else" or "do").
    """
    open_idx = None
    for j in range(start_idx, end_idx):
        if tokens[j][1] == '(':
            open_idx = j
            break
    if open_idx is None:
        return None

    depth = 0
    for j in range(open_idx, end_idx):
        if tokens[j][1] == '(':
            depth += 1
        elif tokens[j][1] == ')':
            depth -= 1
            if depth == 0:
                return (open_idx + 1, j)
    return None


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

OP_LOOKUP = {
    "+": "add",
    "<": "slt",
    "^": "xor",
    "|": "or",
    "&": "and",
    "<<": "sll",
    ">>": "srr",
    "-": "sub",
    ">": "sgt"
}


def convert_expression(tokens: List[Token]) -> List[Token]:
    tokens_strs = [token[1] for token in tokens]

    print(f"Converting {" ".join(tokens_strs)}")

    return tokens

    # Need to handle statements with literals

    opStack: List[Token] = []
    postfix: List[Token] = []

    for token in tokens:
        if token[0] == "punct":

            if token[1] == ")":
                while opStack and not opStack[0][1] == "(":
                    postfix.append(opStack.pop(0))
                if opStack[0][1] == "(":
                    opStack.pop(0)
            else:
                while opStack and ICP[op] <= ISP[opStack[0]]: # type: ignore
                    postfix.append(opStack.pop(0))
                opStack.insert(0, token)
        else:
            postfix.append(token)
    
    while opStack:
        postfix.append(opStack.pop(0))

    print(f"Postfix: {postfix}")

    return postfix


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
# type ("funct_{return_type}" for functions), name, and the scope it was declared in
identifiers: List[Tuple[str, str, int]] = []


def log_identifiers(tokens: List[Token], scope: int, scope_at: List[int]) -> None:
    print("="*100)
    print(f"Logging at scope {scope}: {tokens}")

    if tokens[0][1] in ["int_enc", "int"]:
        if len(tokens) < 3 or tokens[2][1] == "=":
            # variable declaration or initialization
            identifiers.append((tokens[0][1], tokens[1][1], scope))
        elif tokens[2][1] == "[":
            # array declaration or initialization
            identifiers.append((tokens[0][1], tokens[1][1], scope))
        elif tokens[2][1] == "(":
            # function declaration
            identifiers.append((f"funct_{tokens[0][1]}", tokens[1][1], scope))
            # add arguments to the function scope
            scope_inside_funct = scope_at[next((i for i, (_, name, _) in enumerate(tokens) if name == "{"), -1)]
            idx_close_paren = next((i for i, (_, name, _) in enumerate(tokens) if name == ")"), -1)

            for i, token in enumerate(tokens[2:idx_close_paren:3]):
                identifiers.append((token[1], tokens[i + 1 + 2][1], scope_inside_funct))

            # to add: nested function compatibility

    return


def rewrite_line(tokens: List[Token], scope: int) -> str:
    print("="*100)
    print(f"Rewriting at scope {scope}: {tokens}")
    return " ".join([token[1] for token in tokens])


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
    """
    Returns the declared type of `name` as visible from `scope`,
    searching outward through enclosing scopes (innermost-first — this
    is what makes shadowing work: an inner declaration is found before
    an outer one with the same name).
    """
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

    # Pass 1: log every span
    for start_idx, end_idx, _ in spans:
        stmt_tokens = tokens[start_idx:end_idx]
        if not stmt_tokens:
            continue
        scope = scope_at[start_idx]
        log_identifiers(stmt_tokens, scope, scope_at)

    print("="*100)
    print(identifiers)

    # Pass 2: rewrite
    out_parts: List[str] = []
    cursor = 0

    for start_idx, end_idx, kind in spans:
        if start_idx >= end_idx:
            continue
        scope = scope_at[start_idx]

        if kind == 'stmt':
            # unchanged from before: whole statement goes to rewrite_line
            stmt_tokens = tokens[start_idx:end_idx]
            stmt_start_pos = stmt_tokens[0][2]
            last_tok = stmt_tokens[-1]
            stmt_end_pos = last_tok[2] + len(last_tok[1])

            out_parts.append(src[cursor:stmt_start_pos])
            out_parts.append(rewrite_line(stmt_tokens, scope))
            cursor = stmt_end_pos

        else:  # kind == 'header'
            paren_range = find_paren_contents(tokens, start_idx, end_idx)
            if paren_range is None:
                # e.g. bare "else" / "do" — nothing to rewrite, copy verbatim
                continue
            inner_start, inner_end = paren_range
            inner_tokens = tokens[inner_start:inner_end]
            if not inner_tokens:
                continue

            inner_start_pos = inner_tokens[0][2]
            last_tok = inner_tokens[-1]
            inner_end_pos = last_tok[2] + len(last_tok[1])

            # copy everything up to the '(' contents verbatim (return type,
            # function name, keyword like "if"/"while", and the '(' itself)
            out_parts.append(src[cursor:inner_start_pos])
            out_parts.append(rewrite_line(inner_tokens, scope))
            cursor = inner_end_pos
            # the closing ')' and anything after (up to '{') gets copied
            # verbatim on the next iteration's gap-fill

    out_parts.append(src[cursor:])

    with open(processed_file, "w") as f:
        f.write("".join(out_parts))

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python3 preprocess.py <input_file> <output_file>")
        sys.exit(1)

    main(sys.argv[1], sys.argv[2])