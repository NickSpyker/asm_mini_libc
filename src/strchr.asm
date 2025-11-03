[BITS 64]

    GLOBAL strchr
    SECTION .text

strchr:
    xor rax, rax

loop:
    cmp BYTE [rdi], sil
    je end
    cmp BYTE [rdi], 0
    je err
    inc rdi
    jmp loop

end:
    mov rax, rdi
    ret

err:
    mov rax, 0
    ret
