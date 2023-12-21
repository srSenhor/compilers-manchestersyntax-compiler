#include "tokengen.h"
#include "tokens.h"
#include <iostream>

using std::cout;

void TokenGenerator::start()
{
    /* 
        Caso esteja digitando manualmente, use "ctrl+d" para terminar a entrada 
        e caso tenha um arquivo pronto, redirecione a entrada com "<"
    */

    while ((this->lookahead = this->scanner.yylex()) != 0)
    {
        store(this->scanner.YYText(), this->lookahead);
    }

    show();   
}

void TokenGenerator::store(string value, int token)
{
    auto pos = this->table.find(value);
    if(pos == this->table.end())
    {
        this->table.insert({value, token});
        this->ocurrency[token - 1]++;
    } else {
        if(token < CLASS_ID)
        this->ocurrency[token - 1]++;
    } 
}

void TokenGenerator::show()
{
    for(auto iter = table.begin(); iter != table.end(); iter++)
    {
        cout    << "Lexem: "    << iter->first                  << "\t";
        switch(iter->second)
        {
            case SOME:              cout << "Token: SOME"               << "\n"; break;
            case ALL:               cout << "Token: ALL"                << "\n"; break;
            case VALUE:             cout << "Token: VALUE"              << "\n"; break;
            case MIN:               cout << "Token: MIN"                << "\n"; break;
            case MAX:               cout << "Token: MAX"                << "\n"; break;
            case EXACTLY:           cout << "Token: EXACTLY"            << "\n"; break;
            case THAT:              cout << "Token: THAT"               << "\n"; break;
            case NOT:               cout << "Token: NOT"                << "\n"; break;
            case AND:               cout << "Token: AND"                << "\n"; break;
            case OR:                cout << "Token: OR"                 << "\n"; break;
            case ONLY:              cout << "Token: ONLY"               << "\n"; break;
            case CLASS:             cout << "Token: CLASS"              << "\n"; break;
            case EQUIVALENTTO:      cout << "Token: EQUIVALENTTO"       << "\n"; break;
            case SUBCLASSOF:        cout << "Token: SUBCLASSOF"         << "\n"; break;
            case DISJOINTCLASSES:   cout << "Token: DISJOINTCLASSES"    << "\n"; break;
            case INDIVIDUALS:       cout << "Token: INDIVIDUALS"        << "\n"; break;
            case SPECIAL_CHAR:      cout << "Token: SPECIAL_CHAR"       << "\n"; break;
            case NUM:               cout << "Token: NUM"                << "\n"; break;
            case CLASS_ID:          cout << "Token: CLASS_ID"           << "\n"; break;
            case PROP_ID:           cout << "Token: PROP_ID"            << "\n"; break;
            case SUBJECT:           cout << "Token: SUBJECT"            << "\n"; break;
            case DATATYPE:          cout << "Token: DATATYPE"           << "\n"; break;
        };
    }

    cout << "\n\n" << "--- Contador de ocorrências ---" << "\n";

    for(int i = SOME; i < (DATATYPE - 1); i++)
    {
        cout << ocurrency[i-1];

        switch(i)
        {
            case SOME:              cout << " Ocorrencias de SOME"               << "\n"; break;
            case ALL:               cout << " Ocorrencias de ALL"                << "\n"; break;
            case VALUE:             cout << " Ocorrencias de VALUE"              << "\n"; break;
            case MIN:               cout << " Ocorrencias de MIN"                << "\n"; break;
            case MAX:               cout << " Ocorrencias de MAX"                << "\n"; break;
            case EXACTLY:           cout << " Ocorrencias de EXACTLY"            << "\n"; break;
            case THAT:              cout << " Ocorrencias de THAT"               << "\n"; break;
            case NOT:               cout << " Ocorrencias de NOT"                << "\n"; break;
            case AND:               cout << " Ocorrencias de AND"                << "\n"; break;
            case OR:                cout << " Ocorrencias de OR"                 << "\n"; break;
            case ONLY:              cout << " Ocorrencias de ONLY"               << "\n"; break;
            case CLASS:             cout << " Ocorrencias de CLASS"              << "\n"; break;
            case EQUIVALENTTO:      cout << " Ocorrencias de EQUIVALENTTO"       << "\n"; break;
            case SUBCLASSOF:        cout << " Ocorrencias de SUBCLASSOF"         << "\n"; break;
            case DISJOINTCLASSES:   cout << " Ocorrencias de DISJOINTCLASSES"    << "\n"; break;
            case INDIVIDUALS:       cout << " Ocorrencias de INDIVIDUALS"        << "\n"; break;
            case CLASS_ID:          cout << " Ocorrencias de CLASS_ID"           << "\n"; break;
            case PROP_ID:           cout << " Ocorrencias de PROP_ID"            << "\n"; break;
            case SUBJECT:           cout << " Ocorrencias de SUBJECT"            << "\n"; break;
            case DATATYPE:          cout << " Ocorrencias de DATATYPE"           << "\n"; break;
            case SPECIAL_CHAR:      cout << " Ocorrencias de SPECIAL_CHAR"       << "\n"; break;
            case NUM:               cout << " Ocorrencias de NUM"                << "\n"; break;
        }
    }
}
