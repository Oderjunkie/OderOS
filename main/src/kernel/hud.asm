%define HUDcolor 0x4F
HUD:
	db 196, HUDcolor
	db 180, HUDcolor
	times 3 db 32, HUDcolor
	db '/', HUDcolor
	times 2 db 32, HUDcolor
	db '/', HUDcolor
	times 5 db 32, HUDcolor
	db 195, HUDcolor
	times 55 db 196, HUDcolor
	db 180, HUDcolor
	times 3 db 32, HUDcolor
	db ':', HUDcolor
	times 3 db 32, HUDcolor
	db 195, HUDcolor
	db 196, HUDcolor
.end:
%undef HUDcolor
CreateHUD:
	pusha
	mov ax, 0xb800
	mov es, ax
	mov ax, 0x0000
	mov ds, ax
	mov ax, HUD
	mov si, ax
	mov ax, 0x0000
	mov di, ax
	mov cx, HUD.end-HUD
	cld
	rep movsb
	popa
	call UpdateHUD
	ret
UpdateHUD:
	mov ah, 0xb8
	mov ds, ax
	mov ah, 0x02
	int 0x1a
	jc .end ; The carry flag is set when the clock is NOT OPERATING.
	mov al, ch
	call .seperate
	or ax, 0x3030
	; ah -> 144 (0x90)
	; al -> 146 (0x92)
	mov [0x0090], ah
	mov [0x0092], al
	mov al, cl
	call .seperate
	or ax, 0x3030
	; ah -> 150 (0x96)
	; al -> 152 (0x98)
	mov [0x0096], ah
	mov [0x0098], al
	.end:
	xor ax, ax
	mov ds, ax
	ret
	.seperate:
	push bx
	mov bl, al
	mov bh, al
	and bx, 0xF00F
	shr bh, 4
	mov ax, bx
	pop bx
	ret
