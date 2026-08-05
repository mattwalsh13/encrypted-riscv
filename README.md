
# Encrypted RISCV

This is a research project meant to accompany a hardware device capable of handling a custom instruction set of RISC-V. This custom instruction set, uses encrypted integers to minimize the attack area for side channel attacks. This project is a combination of a transpiler and modified LLVM to allow for programs to be written in C and then compiled to RISC-V with the encrypted instructions.

This repo is missing all unmodified/not added files for LLVM as pushing all of the files in one push is not possible, and it is easier to highlight the changes made to LLVM rather than display all of the files.

The idea behind developing programs is to start with normal C code, but with a new data type, encrypted integers (int_enc), which can be handled like normal integers (with some exceptions). This C code in converted to "Encrypted C" with a python script which replaces all of the operations done on encrypted integers with their custom function calls. This Encrypted C is then compiled to Encrypted RISC-V with the custom compiler. This Encrypted RISC-V can then be run on a compatible device.

## Setup

I recommend using an Ubuntu Linux machine, LLVM has specific requirements and the version of LLVM I use requires Ubuntu. Using a different version would possibly require modification of the `/riscv-llvm` files.

Because this repo stores only the changed files, you should create a new, empty directory and create execute the following commands there.

### Get the RISC-V GNU Toolchain

Download the toolchain from [here](https://github.com/riscv-collab/riscv-gnu-toolchain/releases/tag/2024.04.12). Get `riscv32-elf-ubuntu-20.04-llvm-nightly-2024.04.12-nightly.tar.gz`. Unzip it in this repo:

```bash
tar -xf riscv32-elf-ubuntu-20.04-llvm-nightly-2024.04.12-nightly.tar.gz
```

### Get the LLVM

```bash
mkdir -p ./riscv-llvm && git clone --depth 1 https://github.com/llvm/llvm-project.git ./riscv-llvm && rm -rf ./riscv-llvm/.git
```

### Build the LLVM Project

```bash
cd riscv-llvm

mkdir build

cd build

# Change the file path to the GNU directory
cmake -G Ninja -DCMAKE_BUILD_TYPE="Debug" -DBUILD_SHARED_LIBS=True \
 -DLLVM_USE_SPLIT_DWARF=True \
 -DCMAKE_INSTALL_PREFIX="/home/mathw/Research/encrypted-riscv/riscv" \
 -DLLVM_OPTIMIZED_TABLEGEN=True \
 -DLLVM_BUILD_TESTS=False \
 -DLLVM_DEFAULT_TARGET_TRIPLE="riscv32-unknown-elf" \
 -DLLVM_TARGETS_TO_BUILD="RISCV" \
 -DLLVM_ENABLE_PROJECTS="clang" ../llvm

cmake --build . --target install
```

### Copy Over the Modified Files

At this point, you should copy over all of the files in this repo into your created directory. The destination should match the path of the file in this repo. One file `riscv-llvm/llvm/lib/Target/RISCV/RISCVInstrInfoEncrypted.td`, is not in the original `riscv-llvm` directory, but should still be copied over.

### Rebuild LLVM

In `riscv-llvm/build`. If your machine runs out of memory while building, reduce the `-j4` flag to `-j2` or `-j1`.

```bash
cmake -G Ninja /FULL/PATH/TO/YOUR/PROJECT/riscv-llvm/llvm
ninja -j4 clang lld
```

### Get Tools for Viewing Compiled Code

Still in `riscv-llvm/build`

```bash
ninja llvm-objdump
ninja llvm-objcopy
```

### Download the Run on Save Extension

Get the Run on Save extension if you want your C code to be automatically preprocessed into Encrypted C. Identifier: `emeraldwalk.runonsave`

## Usage

You can use the example file `main.c` to test compiling. The MakeFile provides the abilities to:

- compile: directly compiles `main.pp.c` to Encrypted RISC-V
- clean: removes all files created by `make compile`
- preprocess: runs `main.c` through the transpiler that converts normal C to acceptable Encrypted C

You can also have `main.c` be automatically preprocessed (if you use VSCode) by going to `File`->`Open Workspace from File` and then clicking on `encrypted-riscv/preprocess.code-workspace`. Doing this will automatically preprocess your C code. You can view the preprocessed code by viewing `src/main.pp.c`.

### Restrictions on Programming

The current implementation has a few limitations:

- Any operations that mix immediate values and encrypted integers should not contain immediate values that surpass the 12-bit limit
- You may not declare and initialize variables on the same line. You may declare multiple int_encs on the same line or initialize multiple int_encs on the same line, but you cannot mix the two on the same line.

## File Directory

The modified compiler files live in `riscv-llvm` and are what are needed to compile C code.

`main.c` is where raw C code with encrypted integers can be used.

`encrypted_type.h` defines macros for the encrypted operations, and the encrypted integer type.

`preprocess.py` is the transpiler for C to Encrypted C.

`src/main.pp.c` preprocessed (Encrypted) C that is compiled in the end.

`parse_bin.py` script that shows the machine code in a readable format

## Author

Created by Matthew Walsh '28 under the guidance of Dr. Lauren Biernacki as a summer research project for Lafayette College's Electrical and Computer Engineering Department
