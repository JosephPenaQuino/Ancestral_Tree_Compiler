%{
#include "main.h"

int yylex();
int yyerror(char *s);
void print_result(node * nptr);
node * calculate();
node * mo();
node * fa();
node * g(node *nptr);

%}

%union
{
	node * node_ptr;
};

%token MOTHER FATHER GRAND GREAT ART PREP NAME EOL OTHER

%type <node_ptr> stmc stms parent again

%%
program:
        function                	{ exit(0); }
        ;
function:
	| function stms EOL 			{print_result($2);}
	| function stmc EOL				{print_result($2);}
	;

stmc:
	ART parent PREP againc NAME		{$$ = calculate();}
	;

againc:
	| ART parent PREP againc 		{}
	;

stms:
	parent							{$$ = $1;}
	| GRAND parent					{$$ = g($2);}
	| GREAT again 					{$$ = g($2);}
	;
	
again:
	GREAT again						{$$ = g($2);}
	| GRAND parent					{$$ = g($2);}
	;

parent:
	MOTHER 							{$$ = mo();}
	| FATHER 						{$$ = fa();}
	;

%%

int main()
{
    yyparse();
    return 0;
}