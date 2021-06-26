.PHONY: all

all: 
	nasm -f bin code.asm -o code.bin 
	qemu-system-x86_64 code.bin 
