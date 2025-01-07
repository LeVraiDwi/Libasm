bits 64

section .data
    extern	malloc
    extern  ft_strlen
    extern  ft_strcpy

; char *ft_strdup(char *s) => 1st argument rdi

section .text
    global ft_strdup

    ft_strdup:
        call    ft_strlen   ; cherche la taille de la string en parametre 1 rdi
        cmp     rax, 0      ; si la taille est null return null pointeur
        je      ret_zero    
        push    rdi         ; stocke le pointeur sur chaine du premier argument
        mov     rdi, rax    ; deplace la taille de la chaine en premiere argument
        call    malloc WRT ..plt      ; apelle maloc, WRT ..plt permet de au programme principal de passe l' adresse de malloc dans la procedure linkage table evite les proble de relink
        pop     rdi         ; recuperer le pointeur sur chaine
        cmp     rax, 0      ; si null/inf a 0 return 0 il y a eu une erreur, le errno est set par malloc
        jle     ret_zero
        mov     rsi, rdi    ; place le premiere argument dans le 2em
        mov     rdi, rax    ; place le pointeur creer par malloc dans le preimere argument
        call    ft_strcpy   ; appel strcpy
        ret

    ret_zero:
        xor rax, rax    ; set rax a 0
        ret

    