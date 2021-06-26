testm:
        resettextscreen 0x04
        print testmheading
testmloopbegin:
        mov di, cmdstring
testmloop:
        mov ah, 0x00
        int 0x16 
        mov ah, 0x0e
        cmp al, 0xD ; checks for the 'enter' key.
        je testm_commands
        int 0x10 ;print input char to screen
        mov [di], al
        inc di
        jmp testmloop

testm_commands:
        newline
        mov byte [di], 0
        mov al, [cmdstring] 
        cmp al, 'M'
        je main_menu
        cmp al, 'H'
        je helpp
	cmp al, 'R'
	je gfx
	cmp al, 'S'
	je CPTest
	cmp al, 'L'
	je LineTest
	cmp al, 'T'
	je TriangleTest
        jne not_foundtestm
        jmp testmloopbegin

%include "gfx/gfxtests/squaresandrectangles.asm"
%include "gfx/gfxtests/lines.asm"
%include "gfx/gfxtests/triangles.asm"

helpp:                                                                                                                                                       
        print testmhelp                                                                                                                                  
        jmp testmloopbegin

Pregisterstestm:
        resettextscreen 0x0B
        print regheading
        call print_registers
        newline
        print presskeypls
        mov ah, 0x00
        int 0x16 ;get keystroke
        jmp testm ;go back to main menu

not_foundtestm:
        print failuretestmver
        jmp testmloopbegin
