.section .data

# Esse arquivo apenas contêm os dados que serão usados nos outros
# Para ser utilizado com os arquivos que dependem dele:
# as -o persondata.o persondata.s
# ld -o prog persondata.o prog1.o prog2.0 ..

.globl people, numpeople  # declara as partes da memória que serão globais no linking

numpeople:
    .quad (endpeople - people)/PERSON_RECORD_SIZE

people: # início da array de pessoas
    # peso, cabelo, altura, idade
    .quad 200, 2, 74, 20
    .quad 280, 2, 72, 44
    .quad 150, 1, 68, 30
    .quad 250, 3, 75, 24
    .quad 250, 2, 70, 11
    .quad 180, 5, 69, 65
endpeople:  # marca o fim da array

# as distâncias na memória a partir das quais começa cada informação
.globl WEIGHT_OFFSET, HAIR_OFFSET, HEIGHT_OFFSET, AGE_OFFSET
.equ WEIGHT_OFFSET, 0
.equ HAIR_OFFSET, 8
.equ HEIGHT_OFFSET, 16
.equ AGE_OFFSET, 24

.globl PERSON_RECORD_SIZE
.equ PERSON_RECORD_SIZE, 32
