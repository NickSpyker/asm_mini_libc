[BITS 64]

    GLOBAL strrchr
    section .text

strrchr:
    cmp [rdi], BYTE 0
    je loop
    inc rdi
    jmp strrchr

loop:
    cmp sil, BYTE 0
    je exit
    dec rdi
    cmp [rdi], sil
    je exit
    cmp [rdi], BYTE 0
    je exit
    jmp loop

exit:
    cmp [rdi], sil
    jne exitIfNull
    mov rax, rdi
    ret

exitIfNull:
    mov rax, 0
    ret
