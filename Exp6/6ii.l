%{
#include <stdio.h>
#include <string.h>
%}
%option noyywrap
%%
(https?|ftp):\/\/[-A-Za-z0-9+&@#\/%?=~_|!:,.;]*[-A-Za-z0-9+&@#\/%=~_|] {
    printf("URL found in the sample file: %s\n", yytext);
}

.|\n ; 

%%

int main(int argc, char** argv) {
    if (argc != 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }
    
    yyin = fopen(argv[1], "r");
    if (!yyin) {
        printf("Error: Unable to open input file.\n");
        return 1;
    }
    
    yylex();
    fclose(yyin);
    
    return 0;
}