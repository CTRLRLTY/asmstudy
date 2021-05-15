; sframe.asm

extern printf
section .data
  temp db "test satu",10,0
  temp2 db "test dua",10,0
  side1 dq 5
  side2 dq 10
  fmti db "side1: %d side2: %d",10,0
section .bss
section .text
func1:
section .data
  .pi dq 3.14534234
section .text
  push rbp
  mov rbp,rsp

  mov rdi,[rbp+16]
  xor rax,rax
  call printf

  ;mov rdi,[rbp+24] ; test satu
  ;xor rax,rax
  ;call printf

  ;mov rdi,[rbp+16] ; test 2
  ;xor rax,rax
  ;call printf

  leave
  ret

  global main
main:
  push rbp
  mov rbp,rsp
  ;mov rdi,fmti
  push fmti
  mov rsi,[side1]
  mov rdx,[side2]
  ;push rdi 
  ;push rbx
  call func1
  leave
  ret
