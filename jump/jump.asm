extern printf
section .data
    number1 dq  42
    number2 dq  41
    fmt1    db  "NUMBER1 > = NUMBER2",10,0
    fmt2    db  "NUMBER1 < NUMBER2",10,0
section .bss
section .text
    global main
main:
    mov rbp, rsp; for correct debugging
    push rbp
    mov rbp,rsp
    mov rax, [number1]  ; move number1 to rax
    mov rbx, [number2]  ; move number2 to rbx
    cmp rax,rbx         ; compare rax and rbx
    jge greater         ; rax greater or equal go to greater
greater:
    mov rdi, fmt1       ; rax is smaller, continue here
    xor rax,rax         ; no xmm involved
    call printf         ; display fmt
    jmp exit            ; jump to label exit
exit:
    mov rsp, rbp
    pop rbp
    ret