[BITS 64]

	GLOBAL memmove
	SECTION .text

memmove:
    xor rcx, rcx
    cmp rdi, rsi
    jle loop
    jmp rollBack

loop:
    cmp rdx, 0
    je exit
    mov r9b, BYTE [rsi + rcx]
    mov BYTE [rdi + rcx], r9b
    dec rdx
    inc rcx
    jmp loop

exit:
    mov rax, rdi
    ret

rollBack:
    cmp rdx, 0
    je exit
    mov r9b, BYTE [rsi + rdx - 1]
    mov BYTE [rdi + rdx - 1], r9b
    dec rdx
    jmp rollBack
