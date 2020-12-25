[org 0x7c00]
[bits 16]
section .text

mov ax, 0x0240
mov bx, 0x7E00
mov cx, 0x0002
mov dh, 0x00
int 0x13

inc cx
int 0x13

jmp 0x7E00 ; JUMP!


; 781FF in mem
; 1FE00 in FF sectors

; 2E147A on floppy
; 781FF000 in memory
; 789.888 memallocs
; 789 memallocs
; B85.1E8 sectors
; B.8E8E~
; reach AF7



; 78177 bytes written
; reaches 0x7FF77

times 510-($-$$) db 0
dw 0xaa55
