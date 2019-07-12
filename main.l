%{
#include <stdio.h>
void show_error();
%}

%%

"mother"		{printf("mutter\n");}
"father"		{printf("vater\n");}
"grand"			{printf("gross\n");}
"great"			{printf("ur\n");}
"The"			{printf("Die\n");}
"of"			{printf("von\n");}
"Mary"			{printf("Maria\n");}
"John"			{printf("Johan\n");}
[ \t]       	{};       
.				{show_error();}
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
