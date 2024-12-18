bits 64

STDOUT: equ 1
STDIN: equ 0

section .data
    Max_length: equ 35 ; definie une constant qui est longeur max de la cahine lue

section .bss
    buff: resb Max_length ; buffer ou seras ecrit la chaine lu
    
section .text
    global _start ;variable global que le linker utilise pour le point d' entree
    _start: ; definition de start
        mov rax, 0          ; fonction read
        mov rdi, STDIN      ; arg1  de read fd de lecture
        mov rsi, buff       ; arg 2 de read le buffer pour ecrire la lecture
        mov rdx, Max_length ; la taille mac qui seras lue
        syscall             ; appel de la fonction

        mov rax, 1          ; la fonction write
        mov rdi, STDOUT     ; arg1 write la sortie
        mov rsi, buff       ; arg2 write le msg a ecrire
        mov rdx, Max_length ; arg3 write la taille de msg
        syscall

        mov rax, 60     ; fonction exit
        xor rdi, rdi    ; arg1 de exit val retour fait un xor sur rdi le set 0
        syscall
