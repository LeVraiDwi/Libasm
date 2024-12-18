bits 64

section .data
    

section .bss

; add   addition
; adc   addition avec retenue
; sub   soustraction
; sbb   soustraction avec retenue
; pour voir les resultat je peux utiliser gdb
; il faut compiler avec nasm -f elf64 -g -F dwarf src/operation.s
; pou activer les symbole de debug
; puis definir un breakpoint dans gdb: breakpoint _start / b _start
; on affiche les registre avec info registre / i r
; on avance dans le code grace a step / s

; mul multiplication le resultat est stocker dans rax
; imul multiplication signe
; div division euclidienne le resultat est stocker dans rax et le reste dans rdx
; idiv division signe

; si on utilise des valeur imediate asm considere que on utilise des valeur imediate

; 8 bits value maximal 2^8 - 1 = 255 ou -128 a 127 
; 32 bits value maximal 2^32 - 1 = 2147483647
; 64 bits value maximal 2^ 64 - 1 = 1,8447*10^19

section .text
    global _start
    _start:
        ;add rax, 4 ; ajoute 4 au registre rax
        ;xor rax, rax

        ;add rax, 2147483647 ; ajoute la valeur max en 32 bits ce qui fonctionne
        ;xor rax, rax
        ;add rax, 2147483648 ; ajoute la valeur max + 1 en 32 bits ce qui ne fonctionne pas car l' assembleur considere que on est en 32 car on utilise une valeur direct
        ;xor rax, rax
        ;mov rcx, 2147483648 ; je stocke la valeur max + 1 en 32 bits
        ;add rax, rcx        ; j'additionne les 2 registre ce qui ici le compilateur comprend bien que les valeur sont a traiter comme des valeur en 65 bits
        ;xor rax, rax
    
        ;mov rax, 5
        ;mov rbx, 8
        ;mul rbx ; multiplie rax par rbx et stocke le resultat dans rax

        mov rax, 43
        mov rbx, 8
        div rbx ; divise rax par rbx stocke le resultat dans rax, et le reste dans rdx

    exit: ; met fin au programe return 0
        mov rax, 60
        xor rdi, rdi
        syscall