%{
#include <stdio.h>
#include "main.h"
#include "main.tab.h"
void show_error();
%}

%%
"mother"		{return MOTHER;}
"father"		{return FATHER;}
"grand"			{return GRAND;}
"great"			{return GREAT;}
"The"			{return ART;}
"the"			{return ART;}
"of"			{return PREP;}
"Mary"			{return NAME;}
"John"			{return NAME;}
\n 				{return EOL;}
[ \t]       	{};       
.				{show_error(); return (OTHER);}
%%
void show_error()
{
	printf("Lexical error\n");
	exit(0);
}