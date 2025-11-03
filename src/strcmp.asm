[BITS 64]

    GLOBAL strcmp
	SECTION .text

strcmp:
	push rbx
	xor rax, rax
	xor rbx, rbx
	cmp rdi, 0
	jne loop
	cmp rsi, 0
	je exit

loop:
	mov bl, BYTE [rsi]
	cmp BYTE [rdi], bl
	jne sub
	cmp BYTE [rdi], 0
	je exit
	inc rdi
	inc rsi
	jmp loop

sub:
	mov al, BYTE [rdi]
	sub rax, rbx
	jmp exit

exit:
	pop rbx
	ret
