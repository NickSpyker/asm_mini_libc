[BITS 64]

	GLOBAL memset
	SECTION .text

memset:
	xor rcx, rcx

loop:
	cmp rcx, rdx
	je exit
	mov [rdi + rcx], sil
	inc rcx
	jmp loop

exit:
	mov rax, rdi
	ret
