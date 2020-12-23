				align 4
GDT_PTR:		db GDT_END-GDT-1
				dw GDT

;-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-;

				align 16
GDT:			
GDT_NULL:		dq 0
GDT_BOOT_DS:	dw 0xFFFF		; Limit [Low]
				dw 0x0000		; Base [Low]
				db 0x00			; Base [Mid]
				db 0b10010010   ; Access Byte Flags
				db 0b11001111   ; Limit [High] + Flags
				db 0x00         ; Base [High]
GDT_BOOT_CS:	dw 0xFFFF		; Limit [Low]
				dw 0x0000		; Base [Low]
				db 0x00			; Base [Mid]
				db 0b10011010   ; Access Byte Flags
				db 0b11001111   ; Limit [High] + Flags
				db 0x00         ; Base [High]
GDT_END: