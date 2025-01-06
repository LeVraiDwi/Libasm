bits 64

section .text
    global ft_strcmp

    ft_strcmp:
        xor rcx, rcx    ; s'assure que les registre sont a null
        xor rdx, rdx
        xor rax, rax
        jmp ft_compare

    ft_inc:
        inc rcx         ; increment la valeur rax de 1
        jmp ft_compare

    ft_compare:
        cmp BYTE [rdi + rcx], 0 ; compare le byte a la position rdi + rcx 0
        je  difference          ; si la chaine est finie vas a la fonction difference
        cmp BYTE [rsi + rcx], 0 ; compare le byte a la position rsi + rcx 0
        je  difference          ; si la chaine est finie vas a la fonction difference
        mov al, [rsi + rcx]     ; stocke le charactaire a la position rcx de la chaine, dans les 4 dernier bit de rax
        mov dl, [rdi + rcx]     ; stocke le charactaire a la position rcx de la chaine, dans les 4 dernier bit de rdx
        cmp al, dl              ; compare les charactaire
        je  ft_inc              ; si les charactaire sont identique on continue la comparaison
        jne difference          ; si les charactaire sont diferent on saute a la fonction difference

    difference:
        mov dl, [rsi + rcx] 
        mov al, [rdi + rcx]
        sub rax, rdx        ; soustrait le charactaire de la chaine 1 au charactaire de la chaine 2 et place le resultat dans rax
        ret