bits 64

section .data
    

section .bss

; not inverse la valeur dans le registre 1011 -> 0100
; and et logique entre les registre 
; or ou logique entre les registre
; xor ou exclusif entre les registre 

; 8 bits value maximal 2^8 - 1 = 255 ou -128 a 127 
; 32 bits value maximal 2^32 - 1 = 2147483647
; 64 bits value maximal 2^ 64 - 1 = 1,8447*10^19

section .text
    global _start
    _start:
        mov rax, 0b1101 ; 13
        mov rbx, 0b0010 ; -14
        ;not rax ; 0010 => -14
        ;and rax, rbx ; 0
        ;or rax, rbx ; 15
        xor rax, rbx; 15

    exit: ; met fin au programe return 0
        mov rax, 60
        xor rdi, rdi
        syscall