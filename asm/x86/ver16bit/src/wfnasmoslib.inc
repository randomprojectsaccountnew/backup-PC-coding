; reset the screen

%macro resettextscreen 1	
	;set video mode
        mov ah, 0x00
        mov al, 0x03   ;80*25 text mode
        int 0x10

        ;change color/Palette
        mov ah, 0x0B
        mov bh, 0x00
        mov bl, %1
        int 0x10
%endmacro

%macro resetgfxmode 0        
        ;set video mode
	mov ah, 0x00
        mov al, 0x13   ;80*25 text mode
        int 0x10
%endmacro

%macro cp 5 ;convex polygon: color, sourcex, sourcey, endx, endy
	pusha
	mov ah, 0x0C
	mov al, %1
	mov bh, 0x00
	mov cx, %2
	mov dx, %3
	int 0x10
%%cploop:
	inc cx
	int 0x10
	cmp cx, %4
	jne %%cploop

	inc dx
	int 0x10
	mov cx, %2-1
	cmp dx, %5
	jne %%cploop
	popa
%endmacro

%macro mtr 4 ; color, px1, py1, px2, py2, px3, py3
        pusha 
	mov ah, 0x0C  
	mov al, %1 
	mov bh, 0x00 
	mov cx, %2
	mov dx, %3
	int 0x10
	mov si, %2
	mov di, %3
%%triangleloop: ; ok
	mov cx, si
	dec cx
	mov si, cx
	int 0x10
	cmp cx, di
	jne %%repeatintcol
	jmp %%part2
%%part2:
	inc dx
	inc di
	int 0x10
	cmp dx, %4
	jne %%triangleloop 
	popa ; ok
%%repeatintcol:
	inc cx
	int 0x10
	cmp cx, di
	je %%part2
%endmacro ; ok

%macro mlh 4 ;make line (horrizontal): color, startx, y, endx
	pusha
	mov ah, 0x0C
	mov al, %1
	mov bh, 0x00
	mov cx, %2
	mov dx, %3
%%hlineloop:
	inc cx
	int 0x10
	cmp cx, %4
	jne %%hlineloop
	popa
%endmacro

%macro mlv 4 ;make line (vertical): color, starty, x, endy
	pusha
	mov ah, 0x0C
	mov al, %1
	mov bh, 0x00
	mov dx, %2
	mov cx, %3
%%vlineloop:
	inc dx
	int 0x10
	cmp dx, %4
	jne %%vlineloop
	popa
%endmacro

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
        ;pusha ; save all registers to the stack
	mov dx, %1
        mov cx, 0 ; we're using cx as a loop counter
	call hex_loop
%endmacro                                                                                                                               
