%macro input 2
        mov rax, 0
        mov rdi, 0  
        mov rsi, %1    
        mov rdx, %2
        syscall
%endmacro

%macro exit 0
        mov rax, 60
        mov rdi, 0
        syscall
%endmacro

%macro print 1
	mov rax, %1
	mov rbx, 0
%%printLoop:
	mov cl, [rax]
	cmp cl, 0
	je %%endPrintLoop
	inc rbx
	inc rax
	jmp %%printLoop
%%endPrintLoop:
	mov rax, 1
	mov rdi, 0
	mov rsi, %1
	mov rdx, rbx
	syscall
%endmacro



