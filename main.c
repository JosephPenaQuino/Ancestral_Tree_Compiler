#include "main.h"

int yyerror(char *s)
{
	printf("Syntax Error on line %s\n", s);
	return 0;
}

void print_result(node * nptr)
{
	if (nptr->generation >= 2)
	{
		for (int i = 0; i < nptr->generation-1; ++i)
		{
			printf("ur");
		}
		printf("gross");
	}
	else if (nptr->generation == 1)
		printf("gross");

	switch(nptr->parent)
	{
		case mom:
			printf("%s\n", "mutter");		
			break;
		case dad:
			printf("%s\n", "vater");
			break;
	}
}

node * calculate()
{
	node *ptr;

    /* allocate node */
    if ((ptr = malloc(sizeof(node))) == NULL)
        yyerror("out of memory");

    /* copy information */
    ptr->generation = 1;
    ptr->parent = mom;

    return ptr;
}

node * mo()
{
	node *ptr;

    /* allocate node */
    if ((ptr = malloc(sizeof(node))) == NULL)
        yyerror("out of memory");

    /* copy information */
    ptr->generation = 0;
    ptr->parent = mom;

    return ptr;
}

node * fa()
{
	node *ptr;

    /* allocate node */
    if ((ptr = malloc(sizeof(node))) == NULL)
        yyerror("out of memory");

    /* copy information */
    ptr->generation = 0;
    ptr->parent = dad;

    return ptr;
}

node * g(node *nptr)
{
    nptr->generation++;
    return nptr;
}