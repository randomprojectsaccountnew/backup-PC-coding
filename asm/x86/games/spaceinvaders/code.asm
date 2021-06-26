org 7C00h

mov ax, 0013h
int 10h

push 0A000h
pop es ;ES->A0000h

mov al, 0x03
mov cx, 320*260
xor di, di
rep stosb ; [ES:DI], al cx # of times

cli
hlt

times 510-($-$$) db 0 
dw 0xAA55
