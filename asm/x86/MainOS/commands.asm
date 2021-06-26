helpcommand:
        print help
        jmp getinput

Pregisterscommand:
        resettextscreen 0x0B
        print regheading
        call print_registers
        newline
        print presskeypls
        mov ah, 0x00
        int 0x16 ;get keystroke
        jmp main_menu ;go back to main menu

filebrowser:
        resettextscreen 0x00
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
        cmp cx, 19 ; arbitrary number to get the spacing right for now so the sectornum appears correctly
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
        print presskeypls
        mov ah, 0x00
        int 0x16
        jmp main_menu

reboot:
        jmp 0xFFFF:0x0000

