extern __errno_location

section .text
    global ft_write
    
    ft_write:
        mov rax, 1              ; place le pointeur vers la fonction system write
        syscall                 ; appel la fonction pointer ver rax
        cmp rax, 0              ; verifie si la valeur de retur de write est positive
        jl  error_management    ; si negatif place gere l'erreur
        xor rax, rax            ; met rax a 0
        ret                     ; ret rax => 0
    
    error_management:
        mov  rbx, rax           ; sauvegarde la valeur retour
        call __errno_location   ; appel __errno_location qui renvoie le registre dans lequel doit etre sauvegarder l'erreur
        neg rbx                 ; le code de retour de sys_write est negatif je le transforme donc en valeur positive pour obtenir la valeur de errno
        mov [rax], rbx          ; place errno dans le registre associer
        mov rax, -1             ; met rax a -1
        ret                     ; return rax => 0
