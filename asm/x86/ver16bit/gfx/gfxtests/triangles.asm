TriangleTest:
        resetgfxmode
        mtr 0x01, 66, 20, 60
        print presskeypls
        mov ah, 0x00
        int 0x16
        jmp testm
