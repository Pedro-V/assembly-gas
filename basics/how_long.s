# O propósito desse programa é fazer um número x de jumps. Qual deve ser o
# valor de x para que esse programa leve um segundo inteiro para rodar?
# Quantas instruções a CPU executou em 1 segundo?


# No meu sistema, a resposta foi cerca de 500030000, no seu talvez seja diferente.
.globl _start
.section .text
_start:
    mov $500030000, %rcx
    mov $60, %rax
    jmp laco

laco:
    loopq laco
    syscall
