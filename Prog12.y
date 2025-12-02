%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(const char *s);
%}

/* No explicit %token needed; we use character tokens 'a' and 'b' */

%%

input:
      S '\n'    { printf("Valid Input\n"); }
    | '\n'      { yyerror("empty"); }   /* treat empty line as invalid */
    ;

/* Ensure at least 10 matched pairs a^n b^n (n >= 10).
   We force 10 nested wrappers (S -> a S1 b -> a a S2 b b -> ...),
   then S10 can add any additional matched pairs (or be empty).
*/
S:
      a1
    ;

a1:  'a' a2 'b' ;
a2:  'a' a3 'b' ;
a3:  'a' a4 'b' ;
a4:  'a' a5 'b' ;
a5:  'a' a6 'b' ;
a6:  'a' a7 'b' ;
a7:  'a' a8 'b' ;
a8:  'a' a9 'b' ;
a9:  'a' a10 'b' ;
a10:
      /* This is the 10th wrapper; after this we may add more pairs */
      'a' a10 'b'   /* add additional pairs (one or many) */
    | /* empty */   /* stop after exactly 10 pairs */
    ;

%%

void yyerror(const char *s) {
    printf("Invalid Input\n");
    exit(0);
}

int main(void) {
    yyparse();
    return 0;
}