## Compilador simples para *Manchester Syntax*

O seguinte projeto tem como objetivo implementar um compilador simples para um conjunto restrito da [Manchester Syntax](https://www.w3.org/TR/owl2-manchester-syntax/) (usada na OWL2).

## O que foi feito até agora?

- [Analisador léxico](#analisador-lexico)

### Analisador Léxico

O analisador léxico até agora é capaz de reconhecer alguns lexemas que foram pré-definidos, atribuindo um *token* a cada um. O código principal se localiza nos arquivos .cpp, que chamam o lexer para analisar cada lexema e posteriormente armazenar em uma *unordered list* que está sendo usada como tabela de símbolos.

O programa também guarda as ocorrências de cada *token*, contando apenas uma vez para nomes de propriedades, classes, *datatypes* e *subjects*, imprimindo a tabela ao final da leitura e as ocorrências de cada *token*.

É possível acessar os arquivos de teste utilizados no diretório "tests".

## Tecnologias usadas
- Flex
- Make
- CMake