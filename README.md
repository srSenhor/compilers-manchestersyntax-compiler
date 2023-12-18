## Compilador simples para *Manchester Syntax*

O seguinte projeto tem como objetivo implementar um compilador simples para um conjunto restrito da [Manchester Syntax](https://www.w3.org/TR/owl2-manchester-syntax/) (usada na OWL2).

## O que foi feito até agora?

- [Analisador léxico](#analisador-lexico)

### Analisador Léxico

Por ora, ele consegue reconhecer os padrões dos testes e retornar os tokens correspondentes. O objetivo agora é diversificar os tokens de palavras-chave e adicionar mais padrões a serem reconhecidos.

## Tecnologias usadas
- Flex
- Make
- CMake