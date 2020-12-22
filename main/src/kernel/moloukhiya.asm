%define defint(interrupt, handler) mov [interrupt*4], dword handler
[org 0x7e00]
[bits 16]
section .text

jmp $
times 510-($-$$) db 0
dw 0xaa55