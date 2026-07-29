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

C_VARIABLE_KEYWORDS = [
    # Basic Data Types
    "char", "int", "float", "double", "void", "_Bool", "_Complex", "_Imaginary", "int_enc",
    
    # Type Modifiers
    "signed", "unsigned", "short", "long",
    
    # Type Qualifiers
    "const", "volatile", "restrict",
    
    # Storage Class Specifiers
    "auto", "register", "static", "extern", "typedef", "_Thread_local",
    
    # User-Defined Type Structuring
    "struct", "union", "enum"
]


def convert_expression(tokens: List[Token], scope: int) -> Token:
    tokens_strs = [token[1] for token in tokens]

    print(f"Converting {" ".join(tokens_strs)}")

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
                while opStack and ICP[token[1]] <= ISP[opStack[0][1]]: # type: ignore
                    postfix.append(opStack.pop(0))
                opStack.insert(0, token)
        else:
            postfix.append(token)

    while opStack:
        postfix.append(opStack.pop(0))

    print(f"Postfix: {merge_tokens(postfix)}")

    # Convert postfix token list into function calls
    operands: List[Token] = []
    open_paren = ("punct", "(", -1)
    comma_space = ("punct", ", ", -1)
    close_paren = ("punct", ")", -1)

    simp_expr = ()

    print("="*100)
    print("Converting to enc instructions")
    print("="*100)

    for token in postfix:
        print(operands)

        if token[1] in OP_LOOKUP:
            op = OP_LOOKUP[token[1]]
            oper_1_type = operands[0][0]
            oper_2_type = operands[1][0]

            print(oper_1_type)
            print(oper_2_type)

            if oper_1_type == "literal" and oper_2_type  == "literal":
                simp_expr = merge_tokens([open_paren, operands.pop(-2), token, operands.pop(), close_paren])
                simp_expr = ("imm", simp_expr[1], simp_expr[2])
            elif oper_1_type == "literal":
                op_str = "i" + op + "_enc"
                simp_expr = merge_tokens([open_paren, operands.pop(-2), comma_space, operands.pop(), close_paren])
                simp_expr = ("int_enc", op_str + simp_expr[1], simp_expr[2])
            elif oper_2_type == "literal":
                op_str = op + "i" + "_enc"
                simp_expr = merge_tokens([open_paren, operands.pop(-2), comma_space, operands.pop(), close_paren])
                simp_expr = ("int_enc", op_str + simp_expr[1], simp_expr[2])
            else:
                op_str = op + "_enc"
                simp_expr = merge_tokens([open_paren, operands.pop(-2), comma_space, operands.pop(), close_paren])
                simp_expr = ("int_enc", op_str + simp_expr[1], simp_expr[2])

            operands.append(simp_expr)
        else:
            if token[0] == "ident":
                operands.append((lookup_identifier(token[1], scope), token[1], token[2])) # pyright: ignore[reportArgumentType]
            else:
                operands.append(token)

    print(f"Finished conversion {operands}")

    return operands.pop()


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

            for i, token in enumerate(tokens[3:idx_close_paren:3]):
                identifiers.append((token[1], tokens[(i * 3) + 1 + 3][1], scope_inside_funct))

            # to add: nested function compatibility ?

    return


def rewrite_line(tokens: List[Token], scope: int) -> str:
    print("="*100)
    print(f"Rewriting at scope {scope}: {tokens}")

    open_curl = ("punct", "{", -1)
    close_curl = ("punct", "}", -1)

    if tokens[0][1] in ["int_enc"]:
            if len(tokens) < 3:
                # single declaration
                return f"{tokens[0][1]} {tokens[1][1]}"
            elif tokens[2][1] == "=":
                # variable initialization(s)
                comma_indices: List[int] = [0] # 0 is an artificial comma for the first initialization
                depth = 0
                conv_str = tokens[0][1] + " "
                for i, token in enumerate(tokens):
                    if token[1] == ")":
                        depth -= 1
                    elif token[1] == "(":
                        depth += 1
                    elif token[1] == ",":
                        if depth == 0:
                            comma_indices.append(i)

                print(f"Commas at {comma_indices}")

                for i, comma_i in enumerate(comma_indices):
                    if i != 0:
                        conv_str += ", "

                    if i == len(comma_indices) - 1:
                        end = len(tokens)
                    else:
                        end = comma_indices[i + 1]

                    print(f"Tokens to parse: {tokens[comma_i + 3:end]}")

                    value = function_parse(tokens[comma_i + 3:end], scope)
                    if value[0] == "literal":
                        # curly brackets needed
                        conv_str += merge_tokens([tokens[comma_i + 1], ("punct", " = ", -1), open_curl, value, close_curl])[1]
                    else:
                        conv_str += merge_tokens([tokens[comma_i + 1], ("punct", " = ", -1), value])[1]

                return conv_str
            elif tokens[2][1] == "[":
                if len(tokens) > 5:
                    # array initialization
                    values: List[Token] = []
                    comma_indices = [index for index, token in enumerate(tokens[7:]) if token[1] == ',']
                    # artificial comma at the end
                    comma_indices.append(next((i for i, token in enumerate(tokens[7:]) if token[1] == "}"), -1))
                    print(f"Commas at: {comma_indices}")

                    for i, index in enumerate(comma_indices):
                        if i == 0:
                            start = 7
                        else:
                            start = comma_indices[i - 1] + 8

                        value = function_parse(tokens[start:index + 7], scope)

                        if value[0] == "literal":
                            # needs curls
                            value = merge_tokens([open_curl, value, close_curl])

                        values.append(value)

                    print(f"Values: {values}")

                    value_str = ""
                    for value in values[:-1]:
                        value_str += value[1] + ", "
                    value_str += values[-1][1]

                    return "int_enc " + tokens[1][1] + " [" + tokens[3][1] + "] = {" + value_str + "}"
                else:
                    # array declaration
                    pass
            elif not tokens[3][1] in C_VARIABLE_KEYWORDS:
                # multiple var declarations
                conv_str = tokens[0][1] + " "

                for i, token in enumerate(tokens[1::2]):
                    conv_str += token[1]
                    print(i)
                    if not i == (len(tokens) - 1) // 2:
                        conv_str += ", "

                return conv_str
    elif tokens[0][1] in [ident[1] for ident in identifiers]:
            # assignment, function call, or useless line
            if len(tokens) == 1:
                # useless line like "x;"
                pass
            else:
                type = lookup_identifier(tokens[0][1], scope)

                if type == None:
                    print("Syntax error: variable name not recognized in this scope")
                elif type.startswith("funct_"):
                    # function call
                    print(f"Parsing function: {tokens}")
                    parsed = function_parse(tokens, scope)
                    print(f"Parsed: {parsed}")
                    return parsed[1]
                elif type == "int_enc":
                    # int_enc assignments
                    if tokens[1][1] == "=":
                        return f"{tokens[0][1]} = {function_parse(tokens[2:], scope)[1]}"
                    elif tokens[1][1] == "++":
                        return f"{tokens[0][1]} = addi_enc({tokens[0][1]}, 1)"
                    elif tokens[1][1] == "--":
                        return f"{tokens[0][1]} = subi_enc({tokens[0][1]}, 1)"
                    elif tokens[1][1] == "+" and tokens[2][1] == "=":
                        return merge_tokens([tokens[0], ("punct", " = ", -1), function_parse([tokens[0], ("punct", "+", -1), ("punct", "(", -1)] + tokens[3:] + [("punct", ")", -1)], scope)])[1]
                    elif tokens[1][1] == "-" and tokens[2][1] == "=":
                        return merge_tokens([tokens[0], ("punct", " = ", -1), function_parse([tokens[0], ("punct", "-", -1), ("punct", "(", -1)] + tokens[3:] + [("punct", ")", -1)], scope)])[1]
    elif tokens[0][1] == "return":
        return merge_tokens([("ident", "return", -1), ("punct", " ", -1), function_parse(tokens[1:], scope)])[1]

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


def function_parse(tokens: List[Token], scope: int) -> Token:
    """
    Takes in a function call in the form of tokens. Breaks down into the arguments, and converts said arguments (handle nested calls)
    """
    print(f"Parsing: {tokens}")

    for i, token in enumerate(tokens[0:len(tokens) - 1]):
        type = lookup_identifier(token[1], scope)
        if type == None:
            print("Identifier not found")
        elif type.startswith("funct_"):
            function_call = extract_function_call(tokens[i:len(tokens)])
            args: List[List[Token]] = get_arguments(function_call)
            new_args: List[Token] = []

            for arg in args:
                new_args.append(function_parse(arg, scope))

            return replace_args(function_call, new_args)

    return convert_expression(tokens, scope)


def extract_function_call(tokens: List[Token]) -> List[Token]:
    """
    Returns tokens contained by the function call at the start of the list.
    """
    print(f"Extracting from: {tokens}")

    depth = 0 # Tracks if the parenthesis the parser hits is at the right depth and signals the end of the function call

    for i, token in enumerate(tokens):
        if token[1] == ")":
            if depth == 1:
                print(f"Extracted: {tokens[0:i + 1]}")
                return tokens[0:i + 1]
            else:
                depth -= 1
        elif token[1] == "(":
            depth += 1

    return tokens # Should never be returned


def get_arguments(tokens: List[Token]) -> List[List[Token]]:
    """
    Helper function for function_parse. Takes the function call tokens and returns a list of lists of tokens. Each element in the first corresponds to an argument. The inner list is the contents of that specific argument.
    """

    print(f"Getting arguments: {tokens}")

    depth = 0 # Tracks if the parenthesis the parser hits is at the right depth and signals the end of the function call

    args: List[List[Token]] = []
    curr_arg: List[Token] = []

    for token in tokens[2:-1]:
        if token[1] == ")":
            depth -= 1
        elif token[1] == "(":
            depth += 1

        if token[1] == "," and depth == 0:
            args.append(curr_arg)
            curr_arg = []
        else:
            curr_arg.append(token)

    args.append(curr_arg) # Add the last argument

    print(f"Arguments found: {args}")
    return args


def replace_args(function_call: List[Token], new_args: List[Token]) -> Token:
    """
    Parses the function call and replaces each argument with the simplified version, returns a merged token.
    """

    print(f"Replacing args: {function_call} with {new_args}")

    new_args_with_commas: List[Token] = []

    for arg in new_args[0:len(new_args) - 1]:
        new_args_with_commas.append(arg)
        new_args_with_commas.append(("punct", ",", arg[2]))

    new_args_with_commas.append(new_args[len(new_args) - 1])

    function_call_with_new_args = function_call[0:2]
    for arg in new_args_with_commas:
        function_call_with_new_args.append(arg)
    function_call_with_new_args.append(function_call[len(function_call) - 1])

    merged_function = merge_tokens(function_call_with_new_args)
    print(f"Merged: {merged_function}")
    return merged_function


def merge_tokens(tokens: List[Token]) -> Token:
    """
    Merges the given list of tokens together, in the order they are given. The returned token will have the return type and cursor of the first token.
    """

    print(f"Merging: {tokens}")
    token_str = ""

    for token in tokens:
        token_str += token[1]

    return (tokens[0][0], token_str, tokens[0][2])


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
            print(f"scope: {scope}")
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