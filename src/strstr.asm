[BITS 64]

    GLOBAL strstr
    section .text

strstr:
    xor rax, rax
    xor rdx, rdx

loop:
    cmp BYTE [rsi + rdx], 0
    je exit
    cmp BYTE [rdi + rdx], 0
    je exit
    mov r10b, BYTE[rsi + rdx]
    cmp BYTE [rdi + rdx], r10b
    jne errorHandling
    inc rdx
    jmp loop

errorHandling:
    mov rdx, 0
    inc rdi
    jmp loop

exit:
    mov rax, rdi
    ret
