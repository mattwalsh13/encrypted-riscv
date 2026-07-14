all: compile

compile:
	./riscv-llvm/build/bin/clang --target=riscv32-unknown-linux-gnu -c main.c -o main.o
	./riscv-llvm/build/bin/clang -target riscv32-unknown-unknown-elf -S -emit-llvm main.c -o main.ll
	./riscv-llvm/build/bin/llvm-objdump -d main.o > readable_riscv.txt
	./riscv-llvm/build/bin/llvm-objcopy -O binary --only-section=.text main.o raw_code.bin
	python3 parse_bin.py > readable_machine_code.txt

clean:
	rm main.ll
	rm main.o
	rm raw_code.bin
	rm readable_machine_code.txt
	rm readable_riscv.txt