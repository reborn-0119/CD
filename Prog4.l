
%{
#include <stdio.h>
#include <string.h>

char longest[1000] = "";
%}

%%
[A-Za-z]+ {
    if(strlen(yytext) > strlen(longest)) {
        strcpy(longest, yytext);
    }
}
.|\n ;   // ignore everything else
%%

int main() {
    yylex();
    printf("Longest Word: %s\n", longest);
    return 0;
}

int yywrap() { return 1; }