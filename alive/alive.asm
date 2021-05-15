; alive.asm
extern printf
section .data
  msg1      db    "Hello, world!",10,0      ; string with NL and 0
  msg1Len   equ   $-msg1-1                  ; measure the length minus the nullbyte
  msg2      db    "Alive and Kicking!",10,0 ; string with NL and 0
  msg2Len   equ   $-msg2-1                  ; measure the length minus the nullbyte
  radius    dd    357
  pi        dq    3.14
  fmtflt    db    "%lf",10,0
  fmtint    db    "%d",10,0
section .bss
section .text
  global main
main:
  push      rbp                             ; function prologue
  mov       rbp,rsp                         ; function prologue
  mov       rax, 1                          ; 1 = write
  mov       rdi, 1                          ; 1 = to stdout
  mov       rsi, msg1
  mov       rdx, msg1Len
  syscall
  mov       rax, 1                          ; 1 = write
  mov       rdi, 1                          ; 1 = to stdout
  mov       rsi, msg2
  mov       rdx, msg2Len
  syscall
  mov       rax,0                           ; No floating point used
  mov       rdi, fmtint
  mov       rsi, [radius]
  call      printf
  mov       rax, 1                          ; One floating point is used
  mov       rdi, fmtflt
  movq      xmm0, [pi]
  call      printf
  mov       rsp,rbp                         ; function epilogue
  pop       rbp                             ; function epilogue
  ret

