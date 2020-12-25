%include "src/shared/keyboard.asm"
[org 0x7e00]
[bits 16]
section .text

call CreateHUD

loop:

call UpdateHUD

jmp loop

lshiftdown: db 'LShift down',0x0D,0x0A,0
rshiftdown: db 'RShift down',0x0D,0x0A,0

%include "src/kernel/hud.asm"

times 0x8000-($-$$) db 0;
