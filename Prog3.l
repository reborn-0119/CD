
%{
#include <stdio.h>

char shift(char c) {
    if(c >= 'a' && c <= 'z') return (c - 'a' + 3) % 26 + 'a';
    if(c >= 'A' && c <= 'Z') return (c - 'A' + 3) % 26 + 'A';
    return c;
}
%}

%%
.   { putchar( shift(yytext[0]) ); }
%%

int main() {
    yylex();
    return 0;
}

int yywrap() { return 1; }