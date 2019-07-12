all: bison flex
	@gcc -c y.tab.c lex.yy.c
	@gcc y.tab.o lex.yy.o main.c -o main

flex:
	@flex main.l

bison:
	@bison -y -d main.y

lexical: flex
	@gcc lex.yy.c -o main

clean:
	@rm lex.yy.c main y.tab.c y.tab.h