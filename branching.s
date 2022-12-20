.globl _start

# Esse programa deve retornar 26³ como exit code. Mas como exit codes são limitados
# de 0 até 255 (256 números), então vai retornar 168 (26³ % 256)

.section .text

# Um registro especial na CPU é o %rip (instruction pointer)
# Ele mantêm armazenado o endereço da próxima instrução a ser executada do programa
# As operações de jump podem manipular o %rip.
_start:
    movq $7, %rdi
    # com a instrução abaixo, o %rip agora passa a armazenar o endereço associado com a label exit.
    jmp initialize      # se no lugar de jmp initialize executássemos "jmp _start", teríamos um loop infinito

    # essa parte será ignorada
    movq $8, %rbx
    addq %rbx, %rdi

# Uma label responsavel por inicializar os argumentos do exponencial
initialize:
    movq $26, %rbx # nossa base
    movq $3, %rcx  # nosso expoente, também funciona como um counter
    movq $1, %rax  # valor inicial do resultado a ser armazenado em %rax

power_loop:
    ; addq $0, %rcx  # adicionar zero ajuda a saber se %rcx é 0
    ; jz exit        # se já zeramos nosso counter, saímos do programa
    cmpq $0, %rcx
    je exit
    # obs: o computador saber que jz (jump if zero) é verdade pq existe um
    # registro especial chamado %eflags cujos bits representam diferentes sinais
    # um deles é a zero flag, que indica 1 se a última operação aritmética resultou em 0
    mulq %rbx      # caso contrário, continuamos multiplicando.
    # importante falar que mulq sempre multiplica o valor do operando pelo valor em 
    # %rax, e armazena o valor em %rax
    subq $1, %rcx  # e subtraímos um do counter do expoente

    jmp power_loop

exit:
    # movemos o resultado para rdi
    movq %rax, %rdi
    # fazemos a chamada de sistema para sair do processo
    movq $60, %rax
    syscall

