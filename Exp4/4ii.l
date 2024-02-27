%{
#include <stdio.h>
#include <ctype.h> 
int i;
%}

%option noyywrap

%%

"main"|"int"|"printf"|"if"|"else"|"return"|"#include" {
    for(i = 0; i < yyleng; i++)
        fprintf(yyout, "%c", toupper(yytext[i]));
}

.|\n    { fprintf(yyout, "%s", yytext); }

%%

int main() {
    yyin = fopen("input.c", "r");
    if(yyin == NULL) {
        fprintf(stderr, "Error opening file.\n");
        return 1;
    }
    FILE *outputFile = fopen("output.c", "w"); 
    if(outputFile == NULL) {
        fprintf(stderr, "Error creating output file.\n");
        return 1;
    }
    yyout = outputFile; 
    yylex();
    fclose(yyin);
    fclose(outputFile); 
    return 0;
}
