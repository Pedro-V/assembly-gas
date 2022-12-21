# Checa se um dado valor existe num vetor. Retorna 1 como exit code se encontrado
# e 0 caso contrário

.globl _start
.section .data

array:
    .quad 10, 2, 200, 1, 23, 42

length: 
    .quad 6

searched_value:
    .quad 20

.section .text

_start:
    movq length, %rcx
    movq $0, %rdi
    cmpq $0, %rcx
    je exit

loop_search:
    movq array-8(,%rcx, 8), %rax  # começamos a iterar desde o final da array
    # comparar o valor atual com o bsucado, se forem iguais paramos o loop
    # e mudamos o exit code
    cmpq searched_value, %rax 
    je found
    loopq loop_search

exit:
    movq $60, %rax
    syscall

found:
    movq $1, %rdi
    jmp exit
