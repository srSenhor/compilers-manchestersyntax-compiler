%{
#include <iostream>
using std::cout;

enum{ KEYWORD = 1, CLASS_ID, PROP_ID, SUBJECT, DATATYPE, NUM, SPECIAL_CHAR };
%}

%option noyywrap

wp              [ \t]+
upper_letter    [A-Z]
lower_letter    [a-z]
letter          {upper_letter}|{lower_letter}
number          [0-9]
name            {upper_letter}{letter}*
lower_name      {lower_letter}+

subject_id      {name}+({number})+
class_id        {name}+(_name|name)*
prop_id         {lower_name}({name})+
datatype        {lower_name}:({letter})+


%%
{wp}                ;
some|SOME           return KEYWORD;
all|ALL             return KEYWORD;
value|VALUE         return KEYWORD;
min|MIN             return KEYWORD;
max|MAX             return KEYWORD;
exactly|EXACTLY     return KEYWORD;
that|THAT           return KEYWORD;
not|NOT             return KEYWORD;
and|AND             return KEYWORD;
or|OR               return KEYWORD;
only|ONLY           return KEYWORD;
Class:              return KEYWORD; 
EquivalentTo:       return KEYWORD; 
SubClassOf:         return KEYWORD; 
DisjointClasses:    return KEYWORD; 
Individuals:        return KEYWORD; 

"<"         return SPECIAL_CHAR;
">"         return SPECIAL_CHAR;
"("         return SPECIAL_CHAR;
")"         return SPECIAL_CHAR;
"["         return SPECIAL_CHAR;
"]"         return SPECIAL_CHAR;
"{"         return SPECIAL_CHAR;
"}"         return SPECIAL_CHAR;
","         return SPECIAL_CHAR;
"<="        return SPECIAL_CHAR;
">="        return SPECIAL_CHAR;
"=="        return SPECIAL_CHAR;

{number}+     return NUM;
{subject_id}  return SUBJECT;
{class_id}    return CLASS_ID;
{prop_id}     return PROP_ID;
{datatype}    return DATATYPE;

.|\n          ;
%%

/* Uma implentação temporária para testar o reconhecimento de lexemas */
int main()
{
    yyFlexLexer lexer;
    int token = 0;
    while((token = lexer.yylex()) != 0)
    {
        switch(token)
        {
            case 1:     cout << lexer.YYText() << " : palavra-chave \n";       break;
            case 2:     cout << lexer.YYText() << " : classe \n";              break;
            case 3:     cout << lexer.YYText() << " : propriedade \n";         break;
            case 4:     cout << lexer.YYText() << " : instancia \n";           break;
            case 5:     cout << lexer.YYText() << " : tipo de dado \n";        break;
            case 6:     cout << lexer.YYText() << " : numero \n";              break;
            case 7:     cout << lexer.YYText() << " : caractere especial \n";  break;
            default:    cout << lexer.YYText() << " : token nao reconhecido";
        }
    }
}