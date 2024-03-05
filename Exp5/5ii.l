%{
#include <stdio.h>

int char_counts[256] = {0}; 

void findRep() {
  for (int i = 0; i < 256; i++) {
    if (char_counts[i] > 1) {
      printf("Number of times %c repeated : %d\n", i, char_counts[i]);
    }
  }
}
%}

%%

.|\n { char_counts[yytext[0]]++; } 

%%

int main() {
  yylex();
  findRep();
  return 0;
}
