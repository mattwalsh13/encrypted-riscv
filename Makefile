all: compile

compile:
	./riscv-llvm/build/bin/clang --target=riscv32-unknown-linux-gnu -O2 -c main.pp.c -o main.o
	./riscv-llvm/build/bin/clang -target riscv32-unknown-unknown-elf -S -emit-llvm main.pp.c -o main.ll
	./riscv-llvm/build/bin/llvm-objdump -d main.o > readable_riscv.txt
	./riscv-llvm/build/bin/llvm-objcopy -O binary --only-section=.text main.o raw_code.bin
	python3 parse_bin.py > readable_machine_code.txt

clean:
	rm main.ll
	rm main.o
	rm raw_code.bin
	rm readable_machine_code.txt
	rm readable_riscv.txt

clang:
	cd ./riscv-llvm/build && ninja -j4 clang lld

preprocess:
	python3 preprocess.py src/main.c main.pp.c