; Simple Boot loader
	org 0x7c00 ;'origin' of Boot code, helps make sure adresses don't change

	;; Read file table into memory First
	;; set up ES:BX memory adress/segment:offset to load sector(s) into
	mov bx, 0x1000 ; load sector to memory address 0x1000
	mov es, bx ; ES = 0x1000
	mov bx, 0 ; ES:BX = 0x1000:0

	;set up disk read
	mov dh, 0x0 ; head 0
	mov dl, 0x0 ; drive number to load (0 = boot disk) just to be safe
	mov ch, 0x0 ; cylinder 0
	mov cl, 0x02 ;starting sector to read disk

disk_load1:
	mov ah, 0x02 ;BIOS intrerupt 13
	mov al, 0x01 ;Num of sectors to read
	int 0x13 ;BIOS intrerrupts for disk disk functions
	jc disk_load1 ;retry if there's an error

	;; read Kernel into memory second
	;; set up ES:BX memory adress/segment offset to load sector(s) into
        mov bx, 0x2000 ; load sector to memory address 0x2000
        mov es, bx 
        mov bx, 0x0 ; ES:BX = 0x1000:0

        ;set up disk read
        mov dh, 0x0 ; head 0
        mov dl, 0x0 ; drive number to load (0 = boot disk) just to be safe
        mov ch, 0x0 ; cylinder 0
        mov cl, 0x03 ;starting sector to read disk

disk_load2:
        mov ah, 0x02 ;BIOS intrerupt 13
        mov al, 0x02 ;Num of sectors to read
        int 0x13 ;BIOS intrerrupts for disk disk functions
        jc disk_load2

	;; reset segment registers for RAM	
	mov ax, 0x2000
	mov ds, ax ;data segment
	mov es, ax ;extra segment
	mov fs, ax 
	mov gs, ax
	mov ss, ax ;stack segment

	jmp 0x2000:0x0

	;booting magic
	times 510-($-$$) db 0
        dw 0xaa55
