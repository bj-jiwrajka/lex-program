%{
#include "y.tab.c"
%}

%%
[a-zA-Z]   { return LETTER; }
[0-9]+     { return NUMBER; }
[\n]       { return 0; }
.          { return yytext[0]; }
%%

int yywrap() {
    return 1;
}
