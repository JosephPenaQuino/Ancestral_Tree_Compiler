all: main.l main.y
	@bison -d main.y
	@flex main.l
	@cc -o main main.tab.c lex.yy.c -lfl

clean:
	@rm lex.yy.c main.tab.c main.tab.h