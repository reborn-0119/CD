
%{
#include <stdio.h>
#include <stdlib.h>
#include "prog9.tab.h"   /* token definitions from bison (generated header) */
%}

/* Recognize a variable: lowercase letter followed by a single digit (e.g. a1, b9) */
%%

[a-z][0-9]      { return VAR; }
[0-9]+          { yylval = atoi(yytext); return NUMBER; }
[ \t]+          { /* ignore whitespace */ }
"//".*          { /* ignore single-line comments */ }
\n              { return '\n'; }
"("             { return '('; }
")"             { return ')'; }
"+"             { return '+'; }
"-"             { return '-'; }
"*"             { return '*'; }
"/"             { return '/'; }
.               { /* any other char -> cause parse error by returning it */ return yytext[0]; }
%%

int yywrap() { return 1; }