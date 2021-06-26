gfxOS:
	resetgfxmode
	mov  ax, 0x00  ; reset mouse
	int  0X0033        ; -> AX BX
	cmp  ax, 0xFFFF
	jne  NoMouse
	mov  ax, 0001h  ; show mouse
	int  0X0033
MouseLP:
	mov ax,3h
	int 33h
	cmp bx, 01h ; check left mouse click
	mov ax, 0003h
	int 33h
	jne MouseLP


NoMouse:
	print nomouse
