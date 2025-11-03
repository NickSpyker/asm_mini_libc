[BITS 64]

    GLOBAL strpbrk
    SECTION .text

strpbrk:
    xor rax, rax
    xor rcx, rcx

loop:
    cmp BYTE [rdi], 0
    je error
    mov rcx, rsi
    jmp forEvery

forEvery:
    cmp BYTE [rcx], 0
    je gotoLoop
    mov r8b, BYTE [rdi]
    cmp r8b, BYTE [rcx]
    je exit
    inc rcx
    jmp forEvery

gotoLoop:
    inc rdi
    jmp loop

error:
    mov rax, 0
    ret

exit:
    mov rax, rdi
    ret
