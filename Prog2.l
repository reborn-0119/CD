
%{
#include <stdio.h>

int vowels = 0;
int consonants = 0;
%}

%%
[AEIOUaeiou]    { vowels++; }
[BCDFGHJKLMNPQRSTVWXYZbcdfghjklmnpqrstvwxyz] { consonants++; }
.|\n            ;   // ignore anything else
%%

int main() {
    yylex();
    printf("Vowels: %d\n", vowels);
    printf("Consonants: %d\n", consonants);
    return 0;
}

int yywrap() { return 1; }