[BITS 64]

    GLOBAL strncmp
    section .text

strncmp:
    mov r8b, 0
    mov r9b, 0
    jmp loop

errorHandling:
    inc rdi
    inc rsi
    dec rdx

loop:
    cmp rdx, 0
    je exit
    mov r8b, BYTE [rdi]
    mov r9b, BYTE [rsi]
    cmp BYTE [rdi], 0
    je exit
    cmp BYTE [rsi], 0
    je exit
    cmp r8b, r9b
    je errorHandling

exit:
    movzx rax, r8b
    movzx rbx, r9b
    sub rax, rbx
    ret
