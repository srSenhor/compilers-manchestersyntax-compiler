## Compilador simples para *Manchester Syntax*

O seguinte projeto tem como objetivo implementar um compilador simples para um conjunto restrito da [Manchester Syntax](https://www.w3.org/TR/owl2-manchester-syntax/) (usada na OWL2).

## O que foi feito até agora?

- [Analisador léxico](#analisador-lexico)

### Analisador Léxico

O analisador léxico até agora é capaz de reconhecer alguns lexemas que foram pré-definidos, atribuindo um token a cada um. A ocorrência de cada lexema é armazenada junto ao token em uma classe "Token".

É possível acessar os arquivos de teste utilizados no diretório "tests".

## Tecnologias usadas
- Flex
- Make
- CMake