# Verifica se um número POSITIVO é ímpar ou par. Não pode usar o divq

.globl _start
.section .text
_start:
    mov $111, %rax  # nosso número

loop_sub:
    subq $2, %rax # vamos subtraindo 2
    cmpq $0, %rax # se for igual a zero, é pq é par
    je eh_par
    cmpq $1, %rax # se for igual a um, é pq é ímpar
    je eh_impar
    jmp loop_sub  # iteramos novamento se não for nenhum dos 2

eh_par:
    movq $2, %rdi # exit code 2 indica que o número é par
    jmp finish

eh_impar:
    movq $1, %rdi # exit code 1 indica que o número é ímpar
    jmp finish

finish:
    movq $60, %rax
    syscall
