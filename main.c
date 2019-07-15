#include "main.h"

int yyerror(char *s)
{
	printf("Syntax Error on line %s\n", s);
	return 0;
}

void print_result(node * nptr)
{
	if (nptr->generation >= 3)
	{
		for (int i = 1; i < nptr->generation-1; ++i)
		{
			printf("ur");
		}
		printf("gross");
	}
	else if (nptr->generation == 2)
		printf("gross");

	switch(nptr->parent)
	{
		case mom:
			printf("%s", "mutter");		
			break;
		case dad:
			printf("%s", "vater");
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
    ptr->generation = 1;
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
    ptr->generation = 1;
    ptr->parent = dad;

    return ptr;
}

node * g(node *nptr)
{
    nptr->generation++;
    return nptr;
}

node * G(node *nptr, parent_type pt)
{
	nptr->generation++;
	nptr->parent = pt;
	return nptr;
}

parent_type get_pt(node *nptr)
{
	return nptr->parent;
}

node * jo()
{
	node *ptr;

    /* allocate node */
    if ((ptr = malloc(sizeof(node))) == NULL)
        yyerror("out of memory");

    /* copy information */
    ptr->generation = 0;
    ptr->genre = male;
    return ptr;
}

node * ma()
{
	node *ptr;

    /* allocate node */
    if ((ptr = malloc(sizeof(node))) == NULL)
        yyerror("out of memory");

    /* copy information */
    ptr->generation = 0;
    ptr->genre = female;
    return ptr;
}

void print_resultG(node * nptr)
{

	if (nptr->generation < 2)
	{
		if (nptr->parent == mom)
			printf("Die ");
		else
			printf("Dier ");
	}
	else
	{
		if (nptr->parent == mom)
			printf("Eine ");
		else
			printf("Ein ");
	}

	print_result(nptr);

	printf(" von ");

	if (nptr->genre == female)
		printf("Maria\n");
	else
		printf("Johann\n");

}