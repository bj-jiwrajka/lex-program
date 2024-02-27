%{
#include <stdio.h>
int lines = 0;
int words = 0;
int special_chars = 0;
int letters = 0;
%}

%%

\n            { lines++; }               
[a-zA-Z]+     { words++; letters += yyleng; } 
[^a-zA-Z\n\s]+  { special_chars += yyleng; }


%%

int main() {
    yylex();
    printf("Lines: %d\nWords: %d\nSpecial Characters: %d\nLetters: %d\n", lines, words, special_chars, letters);
    return 0;
}
