section .data
  bNum db 123
  qNum dq 12312321321312312
section .bss
section .text
  global main

main:
  push rbp
  mov rbp, rsp

  mov rax, -1 
  mov rax, qword [qNum]
  mov qword [qNum], rsi
  mov qword [qNum], rax

  mov rsp,rbp
  pop rbp

  ret
