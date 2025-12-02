%{
#include <stdio.h>
%}

%%
"if"|"else"|"while"|"for"|"int"|"float"  { printf("Keyword: %s\n", yytext); }
[0-9]+"."[0-9]+                          { printf("Float: %s\n", yytext); }
[0-9]+                                   { printf("Integer: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*                   { printf("Identifier: %s\n", yytext); }
[\+\-\*\/=]                              { printf("Operator: %s\n", yytext); }
"//".*                                   { printf("Comment: %s\n", yytext); }
[ \t\n]                                  ; /* Ignore whitespace */
.                                        { printf("Unknown: %s\n", yytext); }
%%

int main() {
    yylex();
    return 0;
}
int yywrap() { return 1; }