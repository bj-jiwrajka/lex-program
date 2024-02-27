%{
#include <stdio.h>
#include <string.h>
int c = 0;
int k = 0;
int o = 0;
%}

%option noyywrap

%%
[ \t]+                { fprintf(yyout, "%s", yytext); } 
[\n]                  { fprintf(yyout, "%s", yytext); } 
"//"(.)*              { c++; }     
"/*"([^*]|"*"+[^*/])*"*"+"/" { c++; } 
[a-zA-Z_][a-zA-Z0-9_]* { k++; fprintf(yyout, "%s", yytext); }    
[+\-*/=<>!&|^%]+      { o++; fprintf(yyout, "%s", yytext); }     
.                     { fprintf(yyout, "%s", yytext); }           
%%

int main(int argc, char *argv[]) {
    if (argc != 3) {
        printf("Usage: %s input_file output_file\n", argv[0]);
        return 1;
    }

    FILE *input_file = fopen(argv[1], "r");
    if (!input_file) {
        perror("Error opening input file");
        return 1;
    }

    FILE *output_file = fopen(argv[2], "w");
    if (!output_file) {
        perror("Error opening output file");
        fclose(input_file);
        return 1;
    }

    yyin = input_file;
    yyout = output_file;
    yylex();

    fclose(input_file);
    fclose(output_file);

    printf("Keywords: %d\n", k);
    printf("Operators: %d\n", o);
    printf("Comments: %d\n", c);
    return 0;
}
