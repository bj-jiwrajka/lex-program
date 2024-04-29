%{
#include <stdio.h>
%}

IP_ADDRESS ([0-9]{1,3}\.){3}[0-9]{1,3}

%%
{IP_ADDRESS} {
    printf("IP Address present in the file: %s\n", yytext);
}
. ;

%%
int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }
    
    FILE *file = fopen(argv[1], "r");
    if (!file) {
        perror("File couldn't be opened");
        return 1;
    }
    
    yyin = file;
    yylex();
    fclose(file);
    
    return 0;
}
