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
	jnc .end ; The carry flag is set when the clock is NOT OPERATING.
	mov al, ch
	call .seperate
	or ax, 0x3030
	; ah -> 145 (0x91)
	; al -> 147 (0x93)
	mov [0x0091], ah
	mov [0x0093], al
	mov al, cl
	call .seperate
	or ax, 0x3030
	; ah -> 151 (0x97)
	; al -> 153 (0x99)
	mov [0x0097], ah
	mov [0x0099], al
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
