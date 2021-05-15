; fcalc.asm
extern printf
section .data
  number1   dq    9.0
  number2   dq    73.0
  fmt       db    "The numbers are %f and %f",10,0

  fmtfloat  db    "%s %f",10,0
  f_sum     db    "The float sum of %f and %f is %f",10,0
  f_dif     db    "The float difference of %f and %f is %f",10,0
  f_mul     db    "The float product of %f and %f is %f",10,0
  f_div     db    "The float division of %f by %f is %f",10,0
  f_sqrt    db    "The float squareroot of %f is %f",10,0
section .bss
section .text
  global main
main:
  push rbp
  mov rbp,rsp
  ; print numbers
  movsd xmm0,[number1]
  movsd xmm1,[number2]
  mov rdi,fmt
  mov rax,2 ; two floats
  call printf

  ; sum
  movsd xmm2,[number1] ; double precision float into xmm
  addsd xmm2,[number2] ; add double precision to xmm
  ;print the result
    movsd xmm0,[number1]
    movsd xmm1,[number2]
    mov rdi,f_sum
    mov rax,3            ; 3 floats
    call printf
  
  ; mul
  movsd xmm2,[number1]
  mulsd xmm2,[number2]
    ;print the result
    mov rdi,f_mul
    movsd xmm0,[number1]
    movsd xmm1,[number2]
    mov rax,3 ; three floats
    call printf

exit:
  mov rsp,rbp
  pop rbp
  ret
