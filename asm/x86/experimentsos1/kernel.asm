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
	cmp al, 'C' ;file table command/menu option
	je clearscreen
	cmp al, 'R'
	je reboot ; "warm" reboot
	cmp al, 'N'
	je endprogram
	jne not_found 
	jmp getinput

not_found:
	print failure 
	jmp getinput

wait_time db 0

filebrowser:
	mov ah, 0x00
	mov al, 0x03
	int 0x10

	mov ah, 0x00
	mov bh, 0x00
	mov bl, 0x01
	int 0x10

	print filetableheading

        ; load file table string from it's memory location (0x1000), print file
	; and program names & sector numbers to screen for the user to choose
	xor cx, cx
	mov ax, 0x1000
	mov es, ax
	xor bx, bx
	mov ah, 0x0e

filetable_loop:
	inc bx
	mov al, [ES:BX]
	cmp al, '}'
	je stoop
	cmp al, '-'
	je sectornum_loop
	cmp al, ','
	je next_element
	inc cx
	int 0x10
	jmp filetable_loop

sectornum_loop:
	cmp cx, 19 ;arbitrary number to get the spacing right for now
	je filetable_loop
	mov al, ' '
	int 0x10
	inc cx
	jmp sectornum_loop

next_element:
	xor cx, cx
	newline
	newline
	jmp filetable_loop

stoop:
	hlt


reboot:
	jmp 0xFFFF:0x0000

clearscreen:
	ret

endprogram:
	cli
	hlt

cmdstring: db ''
success: db 0xA, 0xD, 'Command found successfully brah', 0xA, 0xD 0
failure: db 0xA, 0xD, 'Something went wrong :( (my life), command not found', 0xA, 0xD, 0
welcome: db 'Kernel booted, hi, what do you wanna do?', 0xA, 0xD, \
'----------------------------------------', 0xA, 0xD, 0xA, 0xD, \
'F) (test) File & Program Browser/Loader', 0xA, 0xD, 'R) Reboot', \
0xA, 0xD, 'N) Turn off', 0xA, 0xD, 'C) Clear screen', 0xA, 0xD, 0 
filetableheading: db '------------     ------', 0xA, 0xD, \
		     'File/Program     Sector', 0xA, 0xD, \
		     '------------     ------', 0xA, 0xD, 0

%include "src/wfnasmoslib2.inc"

        times 1024-($-$$) db 0 ; pad file with 0s until 510th byte
