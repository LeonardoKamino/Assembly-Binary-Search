section .text

global binsearch
binsearch:
    cmp rsi, rdi
    jl not_found
    mov r8, rsi
    sub r8, rdi
    sar r8, 4
    sal r8, 3
    add r8, rdi
    mov r9, qword[r8]
    cmp r9, rdx
    je found
    jg mid_bigger
    jl mid_smaller

mid_bigger:
    sub r8, 8
    mov rsi, r8
    call binsearch
    jmp return

mid_smaller:
    add r8, 8
    mov rdi, r8
    call binsearch
    jmp return

found:
    mov rax, r8
    jmp return

not_found:
    xor rax, rax
        
return:
    ret

