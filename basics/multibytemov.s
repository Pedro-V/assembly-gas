# O propósito desse programa é, dada uma string de caracteres (onde cada 
# caractere requer 1 byte para ser armazenado) , armazenar o endereço de 
# memória da string num registro e verificar quais deles são letras minúsculas

# Por causa da endiannes do sistema, o a primeira letra ("T") estará no byte
# de menor significância. Ou seja, estárá nos últimos 8 bits do registro

# Um sistema little-endian armazena os bytes de menor significância em endereços
# de memória menores

.globl _start
.section .data
mytext:
    .ascii "This is a string of characters.\0" # Logo, o exit code deve ser 24

.section .text
_start:
    movq $mytext, %rbx
    movq $0, %rdi    # a contagem começa em 0

mainloop:
    movq $8, %rcx # um counter para saber quantas rotações foram feitas
    movq (%rbx), %rax

check:
    # Lembrando que %al NÃO contêm o caractere nulo/0. Na verdade, contém o "T"
    # na primeira iteração do loop
    cmpb $0, %al
    je finish
    cmpb $'a', %al
    jb control
    cmpb $'z', %al
    ja control
    incq %rdi  # se não estiver nem abaixo de 'a' ou acima de 'z', é minúscula

control:
    # Aqui rotacionamos o registro 8 bits para a direita
    # Se antes no registro tinha 0x23fa, agora temos 0xa23f
    rorq $8, %rax 
    loopq check      # Aqui se rcx == 0, avançamos
    addq $8, %rbx
    jmp mainloop
    # Outras instruções úteis pra lidar com endiannes: 
    # xchg (troca, como um mov bidirecional) e bswap (reverte a ordem)
    # shr e shl são as operações de shift usual

finish:
    movq $60, %rax
    syscall
