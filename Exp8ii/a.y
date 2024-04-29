%{
    #include<stdio.h>
    int flag = 0;
%}

%token A B

%%
start: amul bmul;
amul: amul A | A;
bmul: bmul B | B;
%%

int yyerror()
{
    printf("the variable is invalid\n");
    flag = 1;
}

void main()
{
    printf("Enter the variable:\n\n> ");
    yyparse();
    if(flag == 0)
        printf("\nEntered variable is Valid\n\n");
}

