import sys

def main(pre_file: str, processed_file: str) -> None:
    """
    Takes a normal .c file that uses int_enc, and injects the correct function call in place of the operation., also ensure encrypted values stay hidden.
    """
    with open(pre_file, 'r', encoding='utf-8') as file:
        for line in file:
            if line.startswith('//'):
                continue
            print(line.strip())

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python3 preprocess.py <input_file> <output_file>")
        sys.exit(1)

    main(sys.argv[1], sys.argv[2])