# Babysteps x86-64 Assembly com GAS

Aprendendo um pouco de x86-64 assembly usando o GNU Assembler.

Todo código foi gerado e executado num sistema Linux de 64-bits.

## Como rodar cada arquivo

```bash
as example.s -o example.o 
ld example.o -o example.out
./example.out
```

## O que cada arquivo faz

- `arithmetic.s` - Não faz nada. Usa as instruções de aritmetica e de movimentação de valores para gerar um exit code, usando uma chamada do sistema operacional pra isso. Pra verificar o exit code, faça `echo $?` após rodar o executável.
- `branching.s` - Explora os jumps que permitem o controle de fluxo
- `better_pow.s` - Uma versão mais curta e direta da potenciação do branching
- `how_long.s` - Apenas realiza jumps até que o programa dure 1s inteiro. Pode variar bastante
- `even_or_odd.s` - Programa que calcula se um número positivo é ímpar ou par sem usar divisão