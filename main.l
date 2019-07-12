%{
#include <stdio.h>
#include "test.tab.h"
void show_error();
%}

%%
"mother"		{return (MOTHER);}
"father"		{return (FATHER);}
"grand"			{return (GRAND);}
"great"			{return (GREAT);}
"The"			{return (THE);}
"of"			{return (OF);}
"Mary"			{return (MARY);}
"John"			{return (JOHN);}
[ \t]       	{};       
.				{show_error(); return (OTHER);}
%%
void show_error()
{
	printf("Lexical error\n");
	exit(0);
}