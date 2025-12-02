%{
#include <stdio.h>
#include <string.h>
%}

%%
.|\n    { /* ignore input */ }
%%

int main() {

    FILE *f = fopen("generated_program.c", "w");
    if (!f) {
        perror("fopen");
        return 1;
    }

    fprintf(f, "#include <stdio.h>\\n");
    fprintf(f, "#include <string.h>\\n\\n");
    fprintf(f, "int main() {\\n");
    fprintf(f, "    char *s = \"abcd\";\\n");
    fprintf(f, "    int n = (int)strlen(s);\\n");
    fprintf(f, "    for (int i = n; i > 0; --i) {\\n");
    fprintf(f, "        for (int j = 0; j < i; ++j) putchar(s[j]);\\n");
    fprintf(f, "        putchar('\\n');\\n");
    fprintf(f, "    }\\n");
    fprintf(f, "    return 0;\\n");
    fprintf(f, "}\\n");

    fclose(f);

    printf("Generated file: generated_program.c\\n");
    return 0;
}

int yywrap() { return 1; }