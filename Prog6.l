%{
#include <stdio.h>

int words = 0;
int chars = 0;
int blanks = 0;   /* count of blank spaces (spaces + tabs) */
int lines = 0;
%}

%%
[A-Za-z0-9_]+    { words++; chars += yyleng; }
\n               { lines++; chars++; }
[ \t]+           { blanks += yyleng; chars += yyleng; }
.                { chars++; }
%%

int main() {
    yylex();
    printf("Words      : %d\n", words);
    printf("Characters : %d\n", chars);
    printf("Blanks     : %d\n", blanks);
    printf("Lines      : %d\n", lines);
    return 0;
}

int yywrap() { return 1; }