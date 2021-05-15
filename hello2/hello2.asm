;hello2.asm
section .data
  msg db "helo, world",0
  NL db 0xa
section .bss
section .text
  global main
main:
  mov rax,1 ; 1 = write
  mov rdi,1 ; 1 = to stdout
  mov rsi,msg ; string to display
  mov rdx,12  ; length of string, without 0
  syscall     ; display the string
  mov rax,1   ; 1 = write
  mov rdi,1   ; 1 = to stdout
  mov rsi,NL  ; display the string
  mov rdx,1   ; length of the string
  syscall
  mov rax,60  ; 60 = exit
  mov rdi,0   ; 0 = success exit code
  syscall     ;quit
