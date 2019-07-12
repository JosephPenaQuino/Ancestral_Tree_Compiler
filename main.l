%{
#include <stdio.h>
void show_error();
%}

m		"mother"
f		"father"
g		"grand"
G 		"great"

%%

{m} 				{printf("Mother\n");}
{f}					{printf("Father\n");}
{g}({m}|{f})+		{printf("Grand\n");}
({G})+{g}({m}|{f})+	{printf("Great\n");}
.					{show_error();}
%%
void show_error()
{
	printf("Lexical error\n");
	exit(0);
}

int yywrap(void) 
{
    return 1;
}

int main(void) 
{
    yylex();
    return 0;
}
