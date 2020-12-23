%define defint(interrupt, handler) mov [interrupt*4], dword handler
[org 0x7c00]
[bits 16]
section .text
cli ; Disable interrupts

in al, 0x70		; |
or al, 0x80		; | [Including NMI] 
out 0x70, al	; |

call EnableA20Line ; Enable the A20 Line.

lgdt [GDT_PTR] ; Load our GDT

mov eax, cr0	; |
or al, 1		; | Set "Protection Enable" high.
mov cr0, eax	; |

jmp 08h:halfway


[BITS 32]

halfway:
; We should have made it now.
mov ax, 0x08
mov ds, ax
mov ss, ax

mov esp, 0x90000

mov [0xB8000], byte 'P'
mov [0xB8001], byte 0x1B

hang:
	hlt
	jmp hang

;defint(0x20, PrintString)
;mov bx, string
;int 0x20


; Enter 32bit mode [UNTESTED]
;cli ; clear ints
;
;in al, 0x92		; \
;or al, 2		; | Enable A20
;out 0x92, al	; /
;
;mov ax, 0x0000	; \ Init
;mov dx, ax		; /  ds
;
;lgdt [GDT_PTR]
;
;mov eax, 0x11
;mov cr0, eax
;
;jmp GDT_BOOT_CS-GDT:halfway
;
;[BITS 32]
;halfway:
;mov ax, GDT_BOOT_DS-GDT
;mov ds, ax
;mov ss, ax
;mov es, ax
;mov esp, 0x90000

;mov edi, 0xb8000
;mov eax, 'T',0x0C,'E',0x0C
;stosd
;mov eax, 'S',0x0C,'T',0x0C
;stosd

;mov ax, 0x4F00
;mov es:di, dword vesabuf
;int 0x10

;mov ax, 'VE'
;cmp ax, word [vesabuf]
;jne not_vesa
;mov ax, 'SA'
;cmp ax, word [vesabuf]
;jne not_vesa.after

;not_vesa:
	
	;mov ax, 0xb800
	;mov ds, ax
	;mov bx, 0
	;mov cx, stringmem.colors-stringmem.chars

	;.start:
	;	mov al, [es:stringmem.chars+bx]
	;	mov ah, [es:stringmem.colors+bx]
	;	push bx
	;		push ax
	;			mov ax, bx
	;			push bx
	;				push dx
	;					mov bx, 2
	;					mul bx
	;					pop dx
	;				pop bx
	;				mov bx, ax
	;			pop ax
	;		mov [ds:bx], byte al
	;		mov [ds:bx+1], byte ah
	;		pop bx
	;	inc bx
	;	loop .start
;.after:

;jmp $

;%include "src/shared/print.asm"
%include "src/boot/gdt.asm"
%include "src/boot/a20.asm"
;string: db "Bootloader Test String.",13,10,0
;vesabuf: times 256 db 0
;stringmem:
;	.chars:
;		db "Bootloader Test String COLORED!"
;		.colors:
;		times 23 db 0x0F
;		db 0x0C
;		db 0x0B
;		db 0x0E
;		db 0x0A
;		db 0x0C
;		db 0x0B
;		db 0x0E
;		db 0x0F
times 510-($-$$) db 0
dw 0xaa55