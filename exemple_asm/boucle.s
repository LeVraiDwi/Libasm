bits 64

section .data
    compteur: dq 6                      ; defini un nombre
    increment: dq 0
    message_boucle: db 'JE BOUCLE!', 10 ; defini le message de la boucle
    message_boucle_len: equ $-message_boucle   ; la longueur du message

section .bss

; dec   decrement value in reg
; inc   increment value in reg
; jnz   jump if not zero

section .text
    global _start
    _start:
        mov rbx, [compteur]   ; place la valeur n2 dans le registre rbx

    loop_dec: ; definie l'etiquette loop_dec qui boucle tant que la valeur dans reg rbx est different de zero
        mov rax, 1
        mov rdi, 1
        mov rsi, message_boucle
        mov rdx, message_boucle_len
        syscall
        dec rbx
        jnz loop_dec ; jump a l'etiquette loop_dec si rbx est different de 0

    xor rbx, rbx
    mov rbx, [increment]

    loop_inc: ; definie l'etiquette loop_inc qui boucle tant que la valeur dans reg rbx est different de zero
        mov rax, 1
        mov rdi, 1
        mov rsi, message_boucle
        mov rdx, message_boucle_len
        syscall
        inc rbx
        cmp rbx, 5
        jne loop_inc ; jump a l'etiquette loop_inc

    exit: ; met fin au programe return 0
        mov rax, 60
        xor rdi, rdi
        syscall