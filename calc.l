%{
#include <stdlib.h>
#include "calc.tab.h"

void yyerror(char*);
extern int yylval;
%}

%%
[ \t]+ ; // Skip whitespace
\n { return *yytext; }
[0-9]+ { yylval = atoi(yytext); return INTEGER; }
[-*+%/] { return *yytext; }
%%

int yywrap() { return 1; }
