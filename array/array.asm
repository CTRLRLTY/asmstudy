; array.asm
%macro print 2
  mov rax,1 ; 1 = write
  mov rdi,1 ; 1 = stdout
  mov rsi,%1
  mov rdx,%2
  syscall
  mov rax,1
  mov rdi,1
  mov rsi,0xa ; newline character or 10
  mov rdx,1
  syscall
%endmacro

extern printf
section .data
  length equ 10
  fmt    db "this is the array value: %d",10,0
section .bss
  drray resq length
section .text
  global main
main:
  push rbp
  mov rbp,rsp

  mov rax,126
  mov rcx,length
  lea rdi,[drray]
array_loop: stosq
  inc rax
  loop array_loop
  mov rdi,fmt
  mov rsi,QWORD[drray+16]
  call printf

  leave
  ret
  
