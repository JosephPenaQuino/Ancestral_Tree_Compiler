%{
	#include <stdio.h>
	int yylex();
	int yyerror(char *s);

%}

%token MOTHER FATHER GRAND GREAT ART PREP NAME EOL OTHER

%%

prog:
	| prog stms EOL 			{}
	;

stms:
	parent						{$$ = $1;}
	| GRAND parent				
	| GREAT again GRAND parent	
	;
	
again:
	| GREAT again				
	;

parent:
	MOTHER 						{$$ = $1;}
	| FATHER 					{$$ = $1;}
	;

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