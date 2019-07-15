#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>

typedef enum {mom, dad} parent_type;
typedef enum {male, female} Genre;

typedef struct Node
{
	int generation;
	parent_type parent;
	Genre genre;
} node;
