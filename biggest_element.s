.globl _start

# Utilizamos um algoritmo guloso para identificar o maior valor de um vetor.
# Esse maior valor é retornado como exit code. Lembrando que exit codes são limitados
# até 255 (Tente substituir 80 por 256!)

.section .data
quant:
    .quad 7
numbers:
    .quad 5, 20, 33, 80, 52, 10, 1

.section .text
_start:
    movq $numbers, %rbx  # endereço do vetor estará em rbx
    movq quant, %rcx     # quantia estará no counter/rcx 
    movq $0, %rdi        # rdi armazena o atual maior número
    # se o tamanho do vetor for zero, pulamos pro final
    cmpq $0, %rbx         
    je endloop

search_biggest:
    movq (%rbx), %rax  # o valor atual analisado é transferido para rax
    # se rax <= rdi, vamos avançar pro próx valor do vetor e retomar o loop
    cmpq %rdi, %rax
    jbe loopcontrol
    # caso contrario, o maior valor do vetor é atualizado
    movq %rax, %rdi

loopcontrol:
    addq $8, %rbx
    loopq search_biggest

endloop:
    movq $60, %rax
    syscall
