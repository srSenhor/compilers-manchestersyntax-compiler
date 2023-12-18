#include "token.h"

Token::Token(int value)
{
    this->value = value;
    this->ocurrency = 1;
}

void Token::increment()
{
    this->ocurrency++;
}

Token::~Token()
{
}