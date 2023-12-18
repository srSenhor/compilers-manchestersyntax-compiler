%{
#include <iostream>
#include <string>
#include <unordered_map>
#include "tokens.h"

using std::cout;
using std::string;
using std::unordered_map;

int token = 0;
unordered_map<string, int> table;

void store(string value, int token);
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
some|SOME           store(YYText(), SOME);
all|ALL             store(YYText(), ALL);
value|VALUE         store(YYText(), VALUE);
min|MIN             store(YYText(), MIN);
max|MAX             store(YYText(), MAX);
exactly|EXACTLY     store(YYText(), EXACTLY);
that|THAT           store(YYText(), THAT);
not|NOT             store(YYText(), NOT);
and|AND             store(YYText(), AND);
or|OR               store(YYText(), OR);
only|ONLY           store(YYText(), ONLY);
Class:              store(YYText(), CLASS);
EquivalentTo:       store(YYText(), EQUIVALENTTO);
SubClassOf:         store(YYText(), SUBCLASSOF);
DisjointClasses:    store(YYText(), DISJOINTCLASSES);
Individuals:        store(YYText(), INDIVIDUALS);

"<"         store(YYText(), SPECIAL_CHAR);
">"         store(YYText(), SPECIAL_CHAR);
"("         store(YYText(), SPECIAL_CHAR);
")"         store(YYText(), SPECIAL_CHAR);
"["         store(YYText(), SPECIAL_CHAR);
"]"         store(YYText(), SPECIAL_CHAR);
"{"         store(YYText(), SPECIAL_CHAR);
"}"         store(YYText(), SPECIAL_CHAR);
","         store(YYText(), SPECIAL_CHAR);
"<="        store(YYText(), SPECIAL_CHAR);
">="        store(YYText(), SPECIAL_CHAR);
"=="        store(YYText(), SPECIAL_CHAR);

{number}+     store(YYText(), NUM);
{subject_id}  store(YYText(), SUBJECT);
{class_id}    store(YYText(), CLASS_ID);
{prop_id}     store(YYText(), PROP_ID);
{datatype}    store(YYText(), DATATYPE);

.|\n          ;
%%

/* Uma implentação temporária para testar o reconhecimento de lexemas */
int main()
{
    yyFlexLexer lexer;
    while((token = lexer.yylex()) != 0)
    {
        cout << "Table size: " << table.size() << "\n";
    }
}

void store(string value, int token)
{
    if(table.find(value) != table.end())
    {
        cout << "This value is already in the table \n"; // TODO: criar uma tabela com as ocorrências de cada token
    } 
    else
    {
        cout << "Inserting " << value << " on table " << "\n";
        table.insert({value, token});
    }
}