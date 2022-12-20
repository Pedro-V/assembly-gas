Assembly é a maneira pela qual um ISA (Instruction Set Architecture) é implementado usando uma linguagem de nível maior que código de máquina (1s e 0s).

### Conceitos
Em geral, a seguinte hierarquia ocorre em assembly:
- Um ISA define o conjunto de instruções, registros e comportamentos de um processador.
   Ex: x86-64 é um ISA, ARM também
- O ISA pode ser implementado de forma diferente por diferentes micro-arquiteturas
   Ex: Golden Cove é uma implementação de x86-64 feita pela Intel
- Para processar código assembly em código de máquina, é necessário um Assembler. Cada Assembler tem uma sintaxe associada. 
   Ex: O GAS (GNU Assembler) usa a sintaxe da AT&T. O NASM usa a sintaxe da Intel. 

   Um assembler geralmente pode ter como "alvo" diferentes ISAs.

## Estrutura

Diretivas são comandos para o assembler, e sempre começam com um ponto (ex: `.globl`). Uma dessas diretivas declara seções do código fonte. Algumas seções muito usadas são `.text` (Onde as instruções e as labels ficam) e `.data` (onde variáveis globais e constantes são declaradas e iniciadas).

Assembly segue uma estrutura fixa bem definida
- Cada linha é uma instrução que segue o seguinte formato:

  endereço da instrução na memória | representação hexadecimal da instrução | opcode | operandos

- Operandos podem ser de 3 tipos:
   - Valores literais: $0x808 é o valor literal 0x808
   - Valores em registros: %rcx representa o valor contido no registro rcx
   - Memória: (%rax) utiliza o valor no registro rax como um endereço de memória. Seria algo como se %rax = 0x808, então (%rax) é M[0x808] (Acessa a memória no endereço 0x808)

Instruções comuns:
- mov S, D    S -> D
- add S, D    D + S -> D
- sub S, D    D - S -> D
- push S      coloca uma cópia de S no topo do stack
- pop D       retira o elemento do topo do stack e o coloca em D
