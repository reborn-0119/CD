%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);
%}

/* use a union so semantic values can hold a double */
%union {
    double val;
}

/* token with semantic value */
%token <val> NUMBER

/* declare expr nonterminal carries a double */
%type <val> expr

/* operator precedence (higher lines = lower precedence number) */
%left '+' '-'
%left '*' '/'

%%

input:
      expr '\n'   { printf("Result = %g\n", $1); }
    | '\n'        { /* empty line -> do nothing */ }
    ;

expr:
      expr '+' expr   { $$ = $1 + $3; }
    | expr '-' expr   { $$ = $1 - $3; }
    | expr '*' expr   { $$ = $1 * $3; }
    | expr '/' expr   { 
                        if ($3 == 0) { yyerror("division by zero"); }
                        $$ = $1 / $3; 
                      }
    | '(' expr ')'    { $$ = $2; }
    | NUMBER          { $$ = $1; }
    ;

%%

void yyerror(const char *s) {
    printf("Invalid Expression: %s\n", s);
    /* do not exit — let bison/lexer continue if desired */
}

int main(void) {
    /* Repeatedly read lines and evaluate until EOF */
    while(1) {
        int res = yyparse();
        if (feof(stdin)) break;
    }
    return 0;
}