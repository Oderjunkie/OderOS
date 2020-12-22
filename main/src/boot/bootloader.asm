%define defint(interrupt, handler) mov [interrupt*4], dword handler
[org 0x7c00]
[bits 16]
section .text

;defint(0x20, PrintString)
;mov bx, string
;int 0x20


; Enter 32bit mode [UNTESTED]
cli ; clear ints

in al, 0x92		; \
or al, 2		; | Enable A20
out 0x92, al	; /

mov ax, 0x0000	; \ Init
mov dx, ax		; /  ds

lgdt [GDT_PTR]

mov eax, 0x11
mov cr0, eax

jmp GDT_BOOT_CS-GDT:halfway

[BITS 32]
halfway:
mov ax, GDT_BOOT_DS-GDT
mov ds, ax
mov ss, ax
mov es, ax
mov esp, 0x90000

mov edi, 0xb8000
mov eax, 'T',0x0C,'E',0x0C
stosd
mov eax, 'S',0x0C,'T',0x0C
stosd

jmp $

%include "src/shared/print.asm"
%include "src/boot/gdt.asm"
string: db "Bootloader Test String.",13,10,0
times 510-($-$$) db 0
dw 0xaa55
