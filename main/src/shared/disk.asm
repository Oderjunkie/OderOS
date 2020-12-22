PROGRAM_SPACE equ 0x7e00

ReadDisc:
	mov ah, 0x02
	mov bx, PROGRAM_SPACE
	mov al, 0x04
	mov dl, [BOOT_DISC]
	mov ch, 0x00
	mov dh, 0x00
	mov cl, 0x02
	int 0x13
	jc .error
	ret
	.error:
		jmp $

BOOT_DISC:
	db 0