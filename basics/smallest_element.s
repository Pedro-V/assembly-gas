.globl _start

# Utilizamos um algoritmo guloso para identificar o menor valor de um vetor.
# Esse menor valor é retornado como exit code. Lembrando que exit codes são limitados
# até 255 (Tente substituir 5 por -1!)

.section .data
length:
    .quad 7
# numbers é um label para o endereço do primeiro número (5)
numbers:
    .quad 5, 20, 33, 80, 52, 10, 1

.section .text
_start:
    # O algoritmo irá começar de trás para frente. Isso é feito pq esse ISA
    # em particular prefere contar os números decrementando até zero.
    movq length, %rcx           # o conteúdo do endereço quant irá pro counter/rcx 
    # precisamos fazer numbers-8 para que o loop comece no índice 6 e termine no índice 0
    # caso contrario iria de 7 até 1
    movq numbers-8(,%rcx, 8), %rdi  # rdi armazena o atual menor número
    # se o tamanho do vetor for zero, pulamos pro final
    cmpq $0, %rcx
    je endloop

search_smallest:
    movq numbers(,%rcx,8), %rax  # o valor atual analisado é transferido para rax
    # se rax >= rdi, vamos avançar pro próx valor do vetor e retomar o loop
    cmpq %rdi, %rax
    jae loopcontrol
    # caso contrario, o menor valor do vetor é atualizado
    movq %rax, %rdi

loopcontrol:
    loopq search_smallest # lembrando q loop automaticamente decrementa rcx

endloop:
    movq $60, %rax
    syscall
