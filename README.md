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
- `branching.s`