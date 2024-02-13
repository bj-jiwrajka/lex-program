%{
#include <stdio.h>
#include <string.h>
%}

%%

[ \t\n]+              
[a-zA-Z_][a-zA-Z0-9_]* { printf("Identifier: %s\n", yytext); }
[+\-*/=<>!&|^%]+      { printf("Operator: %s\n", yytext); }

.                 

%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}
