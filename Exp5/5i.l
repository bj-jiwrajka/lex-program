%{
#include <stdio.h>
#include <string.h>

int cnt = 0;

int is_palindrome(char *str) {
  int len = strlen(str);
  for (int i = 0; i < len / 2; i++) {
    if (str[i] != str[len - i - 1]) {
      return 0;
    }
  }
  return 1;
}
%}

%%

[a-zA-Z]+ {
  if (is_palindrome(yytext)) {
    cnt++;
  }
}

[ \t\n]+

.|\n

%%

int main() {
  yylex();
  printf("Number of palindromes: %d\n", cnt);
  return 0;
}
