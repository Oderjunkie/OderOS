%define defint(interrupt, handler) mov [interrupt*4], dword handler
[org 0x7c00]
[bits 16]
section .text

defint(0x20, PrintString)

mov bx, string
int 0x20

_loop:

jmp _loop

%include "src/shared/print.asm"
string: db "Bootloader Test String.",13,10,0
times 510-($-$$) db 0
dw 0xaa55