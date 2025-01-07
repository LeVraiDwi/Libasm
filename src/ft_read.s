bits 64

section .data
    extern __errno_location

section .text
    global ft_read

    ; size_t  ft_read(int fd, void *buf, size_t count); fd => rdi, buf => rsi, count => rdx

    ft_read:
        mov rax, 0              ; place le pointeur vers la foncton system read
        syscall                 ; appel la fonction
        cmp rax, 0              ; verifie si la valeur de retur de write est positive
        jl  error_management    ; si negatif place gere l'erreur
        ret

    error_management:
        mov  rbx, rax           ; sauvegarde la valeur retour
        call __errno_location WRT ..plt   ; appel __errno_location qui renvoie le registre dans lequel doit etre sauvegarder l'erreur
        neg rbx                 ; le code de retour de sys_write est negatif je le transforme donc en valeur positive pour obtenir la valeur de errno
        mov [rax], rbx          ; place errno dans le registre associer
        mov rax, -1             ; met rax a -1
        ret                     ; return rax => 0