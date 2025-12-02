
%{
#include <stdio.h>
#include <stdlib.h>
#include "calc_eval.tab.h"   /* token definitions from bison header */
%}

%%
[0-9]+(\.[0-9]+)?  { yylval.val = atof(yytext); return NUMBER; }
[ \t]+             { /* ignore whitespace */ }
"\n"               { return '\n'; }
"("                { return '('; }
")"                { return ')'; }
"+"                { return '+'; }
"-"                { return '-'; }
"*"                { return '*'; }
"/"                { return '/'; }
.                  { return yytext[0]; } /* any other char -> pass through (will cause parse error) */
%%

int yywrap() { return 1; }
