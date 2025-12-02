%{
#include <stdio.h>
#include <stdlib.h>

/* provide space for lexical value (we use integer for NUMBER; VAR has no semantic value) */
int yylex(void);
void yyerror(const char *s);
%}

%token NUMBER VAR

/* operator precedence and associativity */
%left '+' '-'
%left '*' '/'

%%

input:
      expr '\n'    { printf("Valid Expression\n"); }
    | '\n'         { /* empty line - treat as invalid for this task */ yyerror("empty"); }
    ;

expr:
      expr '+' expr
    | expr '-' expr
    | expr '*' expr
    | expr '/' expr
    | '(' expr ')'
    | NUMBER
    | VAR
    ;

%%

void yyerror(const char *s) {
    /* On any parse error, print Invalid Expression and exit */
    printf("Invalid Expression\n");
    exit(0);
}

int main(void) {
    /* parse until newline (scanner returns '\n' to end input) */
    yyparse();
    return 0;
}