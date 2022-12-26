# Itera sobre a lista de pessoas e retorna o índice do mais jovem
# Obs: esse arquivo deve ser linkado com o object file de persondata.s
.globl _start
.section .text

_start:
    movq numpeople, %rcx   # rcx atua como counter
    leaq people, %rbx
    movq $0, %rdi          # a maior idade começa como zero

loop_principal:
    cmpq %rdi, AGE_OFFSET(%rbx)
    ja update_age
    jmp loop_control

update_age:
    movq AGE_OFFSET(%rbx), %rdi

loop_control:
    addq $PERSON_RECORD_SIZE, %rbx
    loopq loop_principal  # quando o counter chegar a zero, vai pro label exit

exit: 
    movq $60, %rax
    syscall
