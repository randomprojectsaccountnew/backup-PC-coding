gfxOS:
	mov si, 3
	mov ax, 3

render:
        mov cx, si
	add cx, 6
	mov bx, ax
	add bx, 6

	pusha
        resetgfxmode
	popa
        cp 0x02, 0, 580, 360, 600
        cp 0x03, 100, 70, 200, 110

%macro cursor 5 ;convex polygon: color, sourcex, sourcey, endx, endy
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
//at this point I went on to valley forge to learn the art of gaming in assembly...

        print presskeypls

chckkey:
	mov di, cmdstring
        mov ah, 0x00
        int 0x16
	mov ah, 0x0e
	cmp al, 'W'
        je run_commandz
        cmp al, 'A' ;file table command/menu option
        je run_commandz
        cmp al, 'D'
        je run_commandz ; "warm" reboot
        cmp al, 'S'
        je run_commandz
        cmp al, 'H'
        je run_commandz
        cmp al, 'R'
        je run_commandz
	jmp chckkey

run_commandz:
	cmp al, 'W'
        je up
        cmp al, 'A' ;file table command/menu option
        je left
        cmp al, 'D'
        je right ; "warm" reboot
        cmp al, 'S'
        je down
        cmp al, 'H'
        je helpcommandhere
        cmp al, 'R'
        je main_menu
	jmp run_commandz

up:
	sub ax, 5
	sub bx, 5
	jmp render

down:
        add ax, 5
	add bx, 5
	jmp render

left:
	sub si, 5
	sub cx, 5
	jmp render

right:
 	add si, 5
	sub cx, 5
	jmp render


helpcommandhere:
        print help
	jmp chckkey


