[BITS 64]

	GLOBAL strcspn
	SECTION .text

strcspn:
	push rbx
	xor rax, rax
	xor rbx, rbx
	mov r10, rsi
	jmp loop

loop:
	mov bl, BYTE [r10]
	cmp bl, 0
	je addIncrement
	cmp BYTE [rdi], bl
	je exit
	inc r10
	jmp loop

addIncrement:
	inc rax
	inc rdi
	mov r10, rsi
	cmp BYTE [rdi], 0
	je exit
	jmp loop

exit:
	pop rbx
	ret
