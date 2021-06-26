;;to do: add diagonal lines

LineTest:
	resetgfxmode
	mlh 0x01, 32, 100, 100
	mlv 0x01, 32, 200, 100
	print presskeypls
	mov ah, 0x00
	int 0x16
	jmp testm

