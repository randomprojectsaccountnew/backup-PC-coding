;printing

printloop:
        mov al, [si]
        cmp al, 0
        je endloop
        int 0x10
        inc si
        jmp printloop
endloop:
	ret

;hex stuff

;;; Ascii '0'-'9' = hex 0x30-0x39
;;; Ascii 'A'-'F' = hex 0x41-0x46
;;; Ascii 'a'-'f' = hex 0x61-0x66

hex_loop:  
        cmp cx, 4
        je end_hex_loop  
        ;convert DX hex values to ASCII
        mov ax, dx
        and ax, 0x000F ; 0001 0010 1010 [1011] & 0000 0000 0000 1111
        add al, 0x30
        cmp al, 0x39 ; checking if the hex calue is 0-9(<= 0x39) or A-F
        jle moveintoBX  
        add al, 0x7 ; to get ascii 'A'-'F'

        ;mov ascii char into bx string
moveintoBX:  
        mov bx, hexstring + 5 ;base adress of hex string + str length
        sub bx, cx                                                                                                                                            
        mov [bx], al                                                                                                                                          
        ror dx, 4 ;rotates right by 4 bits, ex: 0x12AB -> 0xB12A -> 0xAB12 -> 0x12AB                                                                          
        add cx, 1                                                                                                                                             
        jmp hex_loop ;loop for next hex digit in DX                                                                                                           
end_hex_loop:                                                                                                                                                 
        mov bx, hexstring                                                                                                                                     
        print hexstring                                                                                                                                       
        popa ; restore all registers from the stack                                                                                                           
        ret ; return to caller  

hexstring: db '0x0000', 0

