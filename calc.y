%{
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

int yylex();
void yyerror(char *S);
%}

%token INTEGER
%left '*' '/' '%'
%left '+' '-'

%%
program:
  | program line
  ;

line:
  '\n'
  | expr '\n' { printf("  = %d\n", $1); }
  ;
  
expr:
  INTEGER { $$ = $1; }
  | expr '+' expr { $$ = $1 + $3; }
  | expr '-' expr { $$ = $1 - $3; }
  | expr '%' expr { $$ = $1 % $3; }
  | expr '*' expr { $$ = $1 * $3; }
  | expr '/' expr { $$ = $1 / $3; }
  ;
%%

void yyerror(char *S) {
  fprintf(stderr, "%s\n", S);
}

int main(int argc, char *argv[]) {
  yyparse();
  return 0;
}
