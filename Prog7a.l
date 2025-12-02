%{
#include <stdio.h>

int done = 0; /* print only once for the first word token */
%}

%%
[A-Za-z]+ {
    if (!done) {
        int n = yyleng;
        for (int i = n; i > 0; --i) {
            for (int j = 0; j < i; ++j) putchar(yytext[j]);
            putchar('\n');
        }
        done = 1;
    }
}
[ \t\r\n]+   { /* ignore whitespace */ }
.            { /* ignore any other character */ }
%%

int main() {
    yylex();
    return 0;
}

int yywrap() { return 1; }