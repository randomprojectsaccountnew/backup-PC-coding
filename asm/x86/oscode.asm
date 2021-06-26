%include "wfasmlib.inc"

section .data
	enteru db "Please enter your username: ", 10, 0
	text1 db "Welcome, ", 0
section .bss
        uname resb 64
section .text 
        global _start

_start:
	print enteru
	input uname, 64
	print text1
	print uname
	exit
