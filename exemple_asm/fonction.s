bits 64

global _start
global aff_chaine
global end_prog

section .data

section .text

    _start: ; la fonction start ajoute 8 a la pile
        sub rsp, 8 ; la pile doit etre aligner a 16 on ajoute donc 8

        mov rdi, 5 ; premier argument de la fonction add_numbers
        mov rsi, 4 ; deuxieme argument
        call add_numbers ; call the fonction add_numbers

        add rsp, 8 ; on remet la pile dans son etat initial

        jmp end_prog

    end_prog:
        mov rax, 60
        xor rdi, rdi
        syscall

    add_numbers:
        mov rax, rdi
        add rax, rsi
        ret