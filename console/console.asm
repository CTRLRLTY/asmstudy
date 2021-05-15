;console.asm
section .data
  msg1 db "Hello, World",10,0
  msg1Len equ $-msg1
  msg2 db "Your turn: ",0
  msg2Len equ $-msg2
  msg3 db "You answered: ",0
  msg3Len equ $-msg3
  inputLen equ 10       ; length of inputBuffer
section .bss
  input resb inputLen+1 ; input buffer
section .text
  global main
main:
  push rbp
  mov rbp,rsp

  mov rsi,msg1          ; print first string
  mov rdx,msg1Len
  call prints

  mov rsi,msg2          ; print second string no NL 
  mov rdx,msg2Len
  call prints

  mov rsi,input         ; address of inputbuffer
  mov rdx,inputLen      ; length of inputbuffer
  call reads

  mov rsi,msg3          ; print third string
  mov rdx,msg3Len
  call prints

  mov rsi,input         ; print the input buffer
  mov rdx,inputLen      ; length of input buffer
  call prints

  mov rsp,rbp
  pop rbp
  ret

prints:
  push rbp
  mov rbp,rsp
  ; rsi contains address of string
  ; rdx contains length of string
  mov rax,1 ; 1 = write
  mov rdi,1 ; 1 = stdout
  syscall
  leave
  ret

reads:
  push rbp
  mov rbp,rsp
  ; rsi contains address of string
  ; rdx contains length of string
  mov rax,0 ; 0 = read
  mov rdi,1 ; 1 = stdin
  syscall
  leave
  ret
