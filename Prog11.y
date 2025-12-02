%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(const char *s);
%}

/* No token declarations needed because we use character tokens 'a' and 'b' */

%%

input:
      S '\n'    { printf("Valid string\n"); }
    | '\n'      { /* empty line - treat as invalid */ yyerror("empty"); }
    ;

S:
      'a' B     /* one 'a' then zero-or-more 'b' */
    ;

B:
      /* empty */   { /* accepts just 'a' */ }
    | 'b' B         /* one b and recurse (accepts b, bb, bbb, ...) */
    ;

%%

void yyerror(const char *s) {
    printf("Invalid string\n");
    exit(0);
}

int main(void) {
    /* parse exactly one line of input (must end with newline) */
    yyparse();
    return 0;
}