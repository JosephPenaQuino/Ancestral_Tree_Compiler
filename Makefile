all: main.l main.y
	@bison -d main.y
	@flex main.l
	@cc -c main.c main.tab.c lex.yy.c
	@cc main.o main.tab.o lex.yy.o -o main -lfl

clean:
	@rm lex.yy.c main.tab.c main.tab.h