
%{
#include <stdio.h>

int lines = 0;
int chars = 0;
%}

%%
\n      { lines++; chars++; }     // newline increases both
.       { chars++; }              // any other character increases char count
%%

int main() {
    yylex();
    printf("Lines: %d\n", lines);
    printf("Characters: %d\n", chars);
    return 0;
}

int yywrap() {
    return 1;
}
