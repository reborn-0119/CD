%{
#include <stdio.h>

int operands = 0;
int operators = 0;
%}

%%
[0-9]+        { operands++; }
[a-zA-Z]+     { operands++; }
[\+\-\*\/]    { operators++; }
[ \t()]+      { /* ignore */ }
\n            { return 0; }
.             { /* ignore invalid chars */ }
%%

int main() {
    yylex();

    if (operands >= 1 && operators >= 1)
        printf("Valid Expression\n");
    else
        printf("Invalid Expression\n");

    return 0;
}

int yywrap() { return 1; }