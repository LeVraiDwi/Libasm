bits 64

section .text
    global ft_strcpy
    
    ft_strcpy:
        xor rax, rax    ; rax a 0
        cmp rsi, 0      ; verifie si la chaine est vide
        jz return       ; return si la est vvide
        jmp copy        ; sinon fait la copy

    increment:
        inc rax         ; increment rax pour avancer dans la chaine
        jmp copy

    copy:
        mov dl, [rsi + rax]     ; copy le caractaire dans les low bit de d 
        mov [rdi + rax] , dl    ; copy dl dans dest => rdi
        cmp dl, 0               ; check si la chaine est terminer
        jnz increment

    return:             ; fontion de retour return rax
        mov rax, rdi
        ret

