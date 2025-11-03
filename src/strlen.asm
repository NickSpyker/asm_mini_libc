[BITS 64]

    GLOBAL strlen
    SECTION .text

strlen:
    push rbp
    mov rbp, rsp
    mov rcx, 0

loop:
    cmp BYTE [rdi + rcx], 0
    jz strlen_end
    inc rcx
    jmp loop

strlen_end:
    mov rax, rcx
    mov rsp, rbp
    pop rbp
    ret
