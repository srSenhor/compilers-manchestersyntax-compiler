%{
#include <iostream>
#include <string>
#include <unordered_map>
#include "token.h"
#include "tokens.h"

using std::cout;
using std::string;
using std::unordered_map;

int token = 0;
unordered_map<string, Token> table;

void store(string value, int token);
void show();
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
datatype        {lower_name}:([ ]?{letter})+


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
 /* Não reconhece DATATYPE como o mesmo lexema caso tenha espaço. Ex.: xsd: integer e xsd:integer */
 //TODO: Separar as funções auxiliares em outro arquivo
int main()
{
    yyFlexLexer lexer;
    while((token = lexer.yylex()) != 0)
    {
        cout << "Table size: " << table.size() << "\n";
    }
    show();
}

void store(string value, int token)
{
    auto pos = table.find(value);
    if(pos != table.end())
    {
        pos->second.increment();
    } 
    else
    {
        table.insert({value, Token(token)});
    }
}

void show()
{
    for(auto iter = table.begin(); iter != table.end(); iter++)
    {
        cout    << "Lexem: "    << iter->first                  << "\t";
        switch(iter->second.getValue())
        {
            case SOME:              cout << "Token: SOME"               << "\t\t"; break;
            case ALL:               cout << "Token: ALL"                << "\t\t"; break;
            case VALUE:             cout << "Token: VALUE"              << "\t\t"; break;
            case MIN:               cout << "Token: MIN"                << "\t\t"; break;
            case MAX:               cout << "Token: MAX"                << "\t\t"; break;
            case EXACTLY:           cout << "Token: EXACTLY"            << "\t\t"; break;
            case THAT:              cout << "Token: THAT"               << "\t\t"; break;
            case NOT:               cout << "Token: NOT"                << "\t\t"; break;
            case AND:               cout << "Token: AND"                << "\t\t"; break;
            case OR:                cout << "Token: OR"                 << "\t\t"; break;
            case ONLY:              cout << "Token: ONLY"               << "\t\t"; break;
            case CLASS:             cout << "Token: CLASS"              << "\t\t"; break;
            case EQUIVALENTTO:      cout << "Token: EQUIVALENTTO"       << "\t\t"; break;
            case SUBCLASSOF:        cout << "Token: SUBCLASSOF"         << "\t\t"; break;
            case DISJOINTCLASSES:   cout << "Token: DISJOINTCLASSES"    << "\t\t"; break;
            case INDIVIDUALS:       cout << "Token: INDIVIDUALS"        << "\t\t"; break;
            case CLASS_ID:          cout << "Token: CLASS_ID"           << "\t\t"; break;
            case PROP_ID:           cout << "Token: PROP_ID"            << "\t\t"; break;
            case SUBJECT:           cout << "Token: SUBJECT"            << "\t\t"; break;
            case DATATYPE:          cout << "Token: DATATYPE"           << "\t\t"; break;
            case SPECIAL_CHAR:      cout << "Token: SPECIAL_CHAR"       << "\t\t"; break;
        };
        cout    << "Ocurrency: "<< iter->second.getOcurrency()  << "\n";
    }
}