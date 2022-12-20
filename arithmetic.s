# Esse é um programa que faz uso da aritmética em assembly, além de chamar
# uma funcionalidade do sistema operacional. Para verificar o resultado, faça
# "echo $?" na linha de comando após rodar o executável desse programa.

.globl _start

.section .text

# As instruções que envolvem valores podem especificar o tamanho deles:
# movq A, B = copia um valor A de 64 bits/8 bytes para B.
# movl A, B = copia um valor A de 32 bits/4 bytes para B
# movw A, B = copia um valor A de 16 bits/2 bytes para B
# movb A, B = copia um valor A de 8 bits/1 byte para B

_start:
    # Podemos "capturar" diferentes partes de um mesmo registro:
    # rdx - 64bits
    # edx - últimos 32bits do rdx
    # dx - últimos 16bits de edx
    # dh - primeiros 8 bits de dx
    # dl - últimos 8 bits de dx
    movw $0x0102, %dx # movemos um valor de 16bits para o registro dx
    addb %dh, %dl     # adicionamos 0x01 + 0x02 (= 0x3) e colocamos no registro dl
    movb $0x0, %dh    # zeramos o registro dh
    subl $1, %edx     # subtraímos 1 ao registro edx (= 0x2)
    # O exit code será armazenado em rdi
    movq %rdx, %rdi
    # 60 é o código da função "exit" nos sistemas Linux de 64 bits.
    movq $60, %rax
    syscall
