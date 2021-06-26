;printing a character

%macro char 1
        mov ah, 0x0e
        mov al, %1
        int 0x10
%endmacro

;printing just a newline character

%macro newline 0
        mov ah, 0x0e
        mov al, 0xA
        int 0x10
	mov al, 0xD
	int 0x10
%endmacro

;printing a string

%macro print 1
	mov ah, 0x0e
	mov si, %1
	mov bl, 0x07 ;color thing
	call printloop 
%endmacro

;hex stuff
%macro printhex 1
        pusha ; save all registers to the stack
	mov dx, %1
        mov cx, 0 ; we're using cx as a loop counter
	call hex_loop
%endmacro                                                                                                                               
