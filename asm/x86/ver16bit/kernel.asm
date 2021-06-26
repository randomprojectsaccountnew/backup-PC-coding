main_menu:
        ;set video mode
        mov ah, 0x00
        mov al, 0x03   ;80*25 text mode
        int 0x10

        ;change color/Palette
        mov ah, 0x0B
        mov bh, 0x00
        mov bl, 0x01
        int 0x10

        ;some other stuff
        %include "src/wfnasmoslib.inc"

	; welcom
        print welcome
	newline
	; get user input, print to screen and choose menu option or run command
getinput:
	mov di, cmdstring ;di now pointing to cmdstring.
keyloop:
	mov ah, 0x00 
	int 0x16 ; BIOS int get keystroke ah = 0.
	mov ah, 0x0e
	cmp al, 0xD ; checks for the 'enter' key.
	je run_command
	int 0x10 ;print input char to screen
	mov [di], al
	inc di
	jmp keyloop

run_command:
	newline
	mov byte [di], 0
	mov al, [cmdstring]
	cmp al, 'F'
	je filebrowser
	cmp al, 'P' ;file table command/menu option
	je Pregisterscommand
	cmp al, 'R'
	je reboot ; "warm" reboot
	cmp al, 'N'
	je stoop
	cmp al, 'H'
	je helpcommand
	cmp al, 'G'
	je gfx
	jne not_found 
	jmp getinput

not_found:
	print failure 
	jmp getinput

%include "commands.asm"
%include "gfx/gfxmenu.asm"
%include "gfx/gfxtests.asm"
%include "gfx/gfxOS.asm"

%include "src/textdefine.inc"
%include "src/wfnasmoslib2.inc"

        times 4096-($-$$) db 0 ; pad file with 0s until 510th byte
