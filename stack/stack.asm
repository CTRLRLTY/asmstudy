; stack.asm
; nasm -f elf64 -g -F dwarf stack.asm -l stack.lst
extern printf
section .data
  string db "ABCDE",0
  stringLen equ $-string-1; stringLength without 0
  fmt1  db "The original string %s",10,0
  fmt2  db "The reversed string %s",10,0
section .bss
section .text
  global main
main:
push rbp
mov rbp,rsp

  ; Print original string
  mov rdi,fmt1
  mov rsi,string
  xor rax,rax
  call printf

  ; Push the string char per char on the stack
  xor rax,rax
  mov rbx,string ; address of string in rbx
  mov rcx,stringLen ; lenght in rcx counter
  mov r12,0 ;use r12 as pointer
  pushLoop:
    mov al, byte [rbx+r12]
    push rax ;push rax on the stack
    inc r12 ; increase the char pointer
    loop pushLoop;

  ; Pop the string char per char from stack
  ; This will reverse the original string
  mov rbx,string ;address of string in rbx
  mov rcx,stringLen ;length in rcx counter
  mov r12,0 ; use r12 as pointer
  popLoop:
    pop rax ; pop a char from the stack
    mov byte [rbx+r12], al ; move the char into string
    inc r12 ; increase char pointer with 1 
    loop popLoop ; continue loop
  mov byte [rbx+r12],0 ; terminate string with 0

  ; Print the reversed string
  mov rdi, fmt2
  mov rsi,string
  xor rax,rax
  call printf

mov rsp,rbp
pop rbp
ret
