%{
	#include <stdio.h>
	int yylex();
	int yyerror(char *s);
%}

%token MOTHER FATHER GRAND GREAT THE OF MARY JOHN OTHER

%type <name> MOTHER
%type <name> FATHER
%type <name> GREAT
%type <name> GRAND
%type <name> THE
%type <name> OF
%type <name> MARY
%type <name> JOHN
%type <name> OTHER

%%

prog:
	stmc | stms
	;

stms:
	parent
	| 
	;

stms
	;

name:
	JOHN | MARY {$$=$1};
parent:
	MOTHER | FATHER {$$=$1};
%%

int yyerror(char *s)
{
	printf("Syntax Error on line %s\n", s);
	return 0;
}

int main()
{
    yyparse();
    return 0;
}