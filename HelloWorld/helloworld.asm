bits 64

global _start

;dup(10) + dup(11)
xor rax,rax
xor rdi,rdi
mov di,10
mov rax,0x20
syscall

xor rax,rax
inc rdi
mov rax,0x20
syscall

_start:
    jmp short message

print:
    pop rsi
    xor rax,rax
    mov al,1
    mov rdi,rax
    xor rdx,rdx
    add rdx,mlen
    syscall

exit:
    xor rax,rax
    add rax,60
    xor rdi, rdi
    syscall

message:
    call print
    msg: db 'https://offensive.ninja',0x0A
    mlen equ $ - msg