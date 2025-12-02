%{
#include <stdio.h>
%}

%%
"a"     { return 'a'; }
"b"     { return 'b'; }
[ \t]+  { /* ignore spaces/tabs */ }
"\n"    { return '\n'; }
.       { return yytext[0]; }   /* any other char will cause parse error */
%%

int yywrap() { return 1; }