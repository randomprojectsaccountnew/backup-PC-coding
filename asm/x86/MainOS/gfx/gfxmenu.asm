gfx:
        resettextscreen 0x0B
        print gfxheading
gfxloopbegin:
	mov di, cmdstring
gfxloop:
        ;; Test Square
        ;cp 0x04, 100, 100, 150, 150
        ;cp 0x02, 20, 20, 20+40, 80
        mov ah, 0x00
        int 0x16 
        mov ah, 0x0e
        cmp al, 0xD ; checks for the 'enter' key.
        je gfx_command
        int 0x10 ;print input char to screen
        mov [di], al
        inc di
        jmp gfxloop

gfx_command:
        newline
        mov byte [di], 0
        mov al, [cmdstring] 
        cmp al, 'R'
        je main_menu
        cmp al, 'H'
        je helpme
	cmp al, 'T'
	je testm
	cmp al, 'O'
	je gfxOS
        jne not_foundgfx
        jmp gfxloopbegin

helpme:
	print gfxhelp
	jmp gfxloopbegin

Pregistersgfx:
        resettextscreen 0x0B
        print regheading
        call print_registers
        newline
        print presskeypls
        mov ah, 0x00
        int 0x16 ;get keystroke
        jmp gfx ;go back to main menu

not_foundgfx:
        print failuregfxver
        jmp gfxloopbegin
