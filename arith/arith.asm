; arith.asm
extern printf
section .data
  p dq 8388607
  q dq 1723823
  e dq 539783
  total db "(p*q)/e %d %d",10,0
section .bss
  phi resq 1
section .text
  global main
main: 
  push rbp
  mov rbp,rsp

  mov rax,[p]
  mov rbx,[q]
  sub rax,1
  sub rbx,1
  imul qword rbx
  idiv qword[e]
  mov rdi,total
  mov rsi,rax
  mov rax,0
  call printf
  xor rdx,rdx

  leave
  ret
