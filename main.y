%{
#include "main.h"

int yylex();
int yyerror(char *s);
void print_result(node * nptr);
node * calculate();
node * mo();
node * fa();
node * g(node *nptr);
node * G(node *nptr, parent_type pt);
node * jo();
node * ma();
parent_type get_pt(node *nptr);
void print_resultG(node * nptr);
%}

%union
{
	node * node_ptr;
};

%token MOTHER FATHER GRAND GREAT ART PREP EOL OTHER JOHN MARY

%type <node_ptr> stmc stms parent again againc name

%%
program:
        function                	{ exit(0); }
        ;
function:
	| function stms EOL 			{print_result($2); printf("\n");}
	| function stmc EOL				{print_resultG($2);}
	;

stmc:
	ART parent PREP name 			{$$ = G($4, get_pt($2));}
	| ART parent PREP againc		{$$ = G($4, get_pt($2));}
	;

againc:
	ART parent PREP name 			{$$ = G($4, get_pt($2));}
	| ART parent PREP againc 		{$$ = G($4, get_pt($2));}
	;

name:
	JOHN							{$$ = jo();}
	| MARY							{$$ = ma();}
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