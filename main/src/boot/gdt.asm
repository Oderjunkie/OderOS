				align 4
GDT_PTR:		dw GDT_END-GDT-1
				dd GDT

;-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-;

				align 16
GDT:			
GDT_NULL:		dq 0
GDT_BOOT_DS:	dd 0xFFFF		; Limit [Low]
				dd 0x0000		; Base [Low]
				db 0x00			; Base [Mid]
				db 0b11110010   ; Access Byte Flags
				db 0b11110011   ; Limit [High] + Flags
				db 0x00         ; Base [High]
GDT_BOOT_CS:	dd 0xFFFF		; Limit [Low]
				dd 0x0000		; Base [Low]
				db 0x00			; Base [Mid]
				db 0b11111010   ; Access Byte Flags
				db 0b11110011   ; Limit [High] + Flags
				db 0x00         ; Base [High]
GDT_END: