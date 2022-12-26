# O programa calcula e retorna maior imc do dataset como exit code.
# To-do: Usar floats
.globl _start

.section .text

_start:
    movq numpeople, %rcx
    leaq people, %rbx
    movq $0, %rdi
    movq $703, %r9

loop_principal:
    # calcula o imc para a pessoa da vez (peso/altura²) * 703, pois são libras e polegadas
    movq WEIGHT_OFFSET(%rbx), %rax
    divq HEIGHT_OFFSET(%rbx)
    divq HEIGHT_OFFSET(%rbx)
    mulq %r9
    # 
    cmpq %rdi, %rax
    jbe loop_control
    movq %rax, %rdi

exit:
    movq $60, %rax
    syscall

loop_control:
    addq $PERSON_RECORD_SIZE, %rbx
    loopq loop_principal
    