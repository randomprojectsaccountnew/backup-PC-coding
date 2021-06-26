all:
	nasm -f bin filetable.asm -o bin/filetable.bin
	nasm -f bin kernel.asm -o bin/kernel.bin
	nasm -f bin bootsect.asm -o bin/boot.bin
	cat bin/boot.bin bin/filetable.bin bin/kernel.bin > bin/OS.bin
	bochs  
clean:
	rm bin/*.bin
