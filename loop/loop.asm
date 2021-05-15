; loop asm
extern printf
section .data
  fmtstr  db  "Loop %d",10,0
  qNum    dq  10
section .bss
section .text
  global main
main:
  push rbp
  mov rbp,rsp
  xor rax,rax
loop:
  mov rax,rbx
  mov rdi,fmtstr
  mov rsi,rax
  call printf
  inc rbx
  cmp rbx,[qNum]
  jle loop

  mov rsp,rbp
  pop rbp
  ret

