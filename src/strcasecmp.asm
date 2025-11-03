[BITS 64]

    GLOBAL strcasecmp
	SECTION .text

strcasecmp:
	push rbx
	xor rax, rax
	xor rbx, rbx

loop:
	mov r8, rdi
	mov bl, BYTE [rsi]
	mov rdi, rbx
	call DiffLower
	mov rdi, r8
	mov bl, al
	mov r8, rdi
	mov al, BYTE [rdi]
	mov rdi, rax
	call DiffLower
	mov rdi, r8
	cmp rax, rbx
	jne DiffThenExit
	xor rax, rax
	cmp BYTE [rdi], 0
	je exit
	inc rdi
	inc rsi
	jmp loop

DiffLower:
	mov rax, rdi
	cmp rax, 65
	jl DiffLower_exit
	cmp rax, 90
	jg DiffLower_exit
	add rax, 32

DiffLower_exit:
	ret

DiffThenExit:
	sub rax, rbx
	jmp exit

exit:
	pop rbx
	ret
