EnableA20Line:
	call fasta20
	ret
fasta20:
	in al, 0x92
	test al, 2
	jnz .end
	or al, 2
	and al, 0xFE
	out 0x92, al
	.end:
	ret
slowa20:
	call .wait
	mov al, 0xAD
	out 0x64, al
	call .wait
	mov al, 0xD0
	out 0x64, al
	.wait2:
		in al, 0x64
		test al, 1
		jz .wait2
	mov al, 0x60
	push ax
	call .wait
	mov al, 0xD1
	out 0x64, al
	call .wait
	pop ax
	or al, 2
	out 0x60, al
	call .wait
	mov al, 0xAE
	out 0x64, al
	call .wait
	sti
	ret
	.wait:
		in al, 0x64
		test al, 2
		jnz .wait
		ret