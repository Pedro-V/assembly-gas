# Esse programa faz a mesma coisa que branching.s, mas com uma escrita melhor,
# sem as partes desnecessárias daquele

.globl _start
.section .text
_start:
    movq $26, %rbx
    movq $3, %rcx
    movq $1, %rax

power_loop:
    mulq %rbx
    loopq power_loop # decrementa %rcx e pula pra power_loop se %rcx ficar diferente de 0

exit:
    mov %rax, %rdi
    mov $60, %rax
    syscall
