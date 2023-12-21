#include <FlexLexer.h>
#include <unordered_map>
#include <string>

using std::string;
using std::unordered_map;

class TokenGenerator
{
private:
    yyFlexLexer scanner;
    int lookahead;
    unordered_map<string, int> table;
    int ocurrency[22] = {0};

public:
    void start();
    void store(string value, int token);
    void show();
};
