import sys
import re

def main(pre_file: str, processed_file: str) -> None:
    """
    Takes a normal .c file that uses int_enc, and injects the correct function call in place of the operation., also ensure encrypted values stay hidden.
    """
    lines: list[str] = []

    with open(pre_file, "r", encoding="utf-8") as file:
        for line in file:
            if line.startswith("//"):
                continue
            lines.append(line)

    variables: set[str] = set()
    ops = ["+", "-"]
    op_strs = ["add", "sub"]
    op_str_lookup = dict(zip(ops, op_strs))

    for i, unstripped_line in enumerate(lines):
        line = unstripped_line.strip()
        # Variable declaration
        if line.startswith("int_enc"):
            variables.add(line.split("=")[0].split(" ")[1].rstrip(";"))
        # Variable used
        elif any(word in line for word in variables):
            # Operation done
            if any(op in line for op in ops):
                op = next(op for op in ops if op in line)
                leading_whitespace = re.match(r"^\s*", unstripped_line).group(0)
                tokens = line.strip().split("=")
                dest = tokens[0].strip(" ")
                operand_1 = tokens[1].split(op)[0].strip(" ")
                operand_2 = tokens[1].split(op)[1].rstrip(";").strip(" ")
                lines[i] = f"{leading_whitespace}{dest} = enc_{op_str_lookup[op]}({operand_1}, {operand_2});\n"

    with open(processed_file, "w") as file:
        for line in lines:
            file.write(line)

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python3 preprocess.py <input_file> <output_file>")
        sys.exit(1)

    main(sys.argv[1], sys.argv[2])