;;to do: try making a moving square.

CPTest:
	resetgfxmode
	cp 0x01, 0, 65, 200, 100
	cp 0x03, 100, 70, 200, 110
	print presskeypls
	mov ah, 0x00
	int 0x16
	jmp testm
