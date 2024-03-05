%{
#include <stdio.h>
#include <string.h>

int palindrome_count = 0;

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
    palindrome_count++;
  }
}

[ \t\n]+

.|\n

%%

int main() {
  yylex();
  printf("Number of palindromes: %d\n", palindrome_count);
  return 0;
}
