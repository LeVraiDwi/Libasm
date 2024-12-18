bits 64

section .data
    n1: dq 6                                        ; defini un nombre
    n2: dq 5                                        ; defini un nombre
    message_equ: db 'value are equals', 10          ; defini le message en cas d'egaliter
    message_equ_len: equ $-message_equ              ; la longueur du message
    message_not_equ: db 'value are not equals', 10  ; le message en as d'inegaliter
    message_not_equ_len: equ $-message_not_equ      ; la longueur du message

section .bss

; je    jump if equals
; jne   jump if not equals
; jg    jump if greater
; jl    jump if lower
; jge   jump if greater or equals
; jle   jump if lower or equals

section .text
    global _start
    _start:
        mov rax, [n1]   ; place la valeur n1 dans le registre rax
        mov rbx, [n2]   ; place la valeur n2 dans le registre rbx
        cmp rax, rbx    ; compare la valeur numerique dans le 2 registre rax rbx
        je  equals      ; si les valeur dans rax et rbx sont equal jump a l'etiquette equals
        jne not_equals  ; si non egal jum a l'etiquette not_equals

    equals: ; definie l'etiquette equals qui affiche le message : message_equ 
        mov rax, 1
        mov rdi, 1
        mov rsi, message_equ
        mov rdx, message_equ_len
        syscall
        jmp exit ; jump a l'etiquette exit

    not_equals: ; definie l'etiquette equals qui affiche le message: message_not_equ
        mov rax, 1
        mov rdi, 1
        mov rsi, message_not_equ
        mov rdx, message_not_equ_len
        syscall
        jmp exit ; jump a l'etiquette exit si le jump n' est pas fait le programme continue

    exit: ; met fin au programe return 0
        mov rax, 60
        xor rdi, rdi
        syscall