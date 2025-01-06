bits 64

section .text
    global ft_strlen
    
    ft_strlen:
        xor rax, rax    ; rax set a 0
        jmp ft_compare  ; jump a ft_compare

    ft_inc:
        inc rax         ; increment la valeur rax de 1
        jmp ft_compare

    ft_compare:
        cmp BYTE [rdi + rax], 0 ; compare le byte a la position rdi + rax 0
        jne ft_inc              ; si le caractaire de fin n'est pas atteint on increment rax
        ret                     ; on return rax