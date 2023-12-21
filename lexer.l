%{
#include <iostream>
#include "tokens.h"

using std::cout;
%}

%option noyywrap

wp              [ \t\n]+
upper_letter    [A-Z]
lower_letter    [a-z]
letter          {upper_letter}|{lower_letter}
number          [0-9]
name            {upper_letter}{letter}*
lower_name      {lower_letter}+

subject_id      {name}+({number})+
class_id        {name}+(_name|name)*
prop_id         {lower_name}({name})*
datatype        {lower_name}:([ ]?{letter})+


%%
{wp}                ;
some|SOME           return SOME;
all|ALL             return ALL;
value|VALUE         return VALUE;
min|MIN             return MIN;
max|MAX             return MAX;
exactly|EXACTLY     return EXACTLY;
that|THAT           return THAT;
not|NOT             return NOT;
and|AND             return AND;
or|OR               return OR;
only|ONLY           return ONLY;
Class:              return CLASS;
EquivalentTo:       return EQUIVALENTTO;
SubClassOf:         return SUBCLASSOF;
DisjointClasses:    return DISJOINTCLASSES;
Individuals:        return INDIVIDUALS;

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

.             cout << YYText() << ": termo não reconhecido" << "\n";
%%

 /* Não há funções auxiliares */