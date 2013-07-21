
all:
	bison -d calc.y
	flex -o calc.lex.c calc.l
	cc -o a.out calc.tab.c calc.lex.c -lfl
clean:
	rm calc.tab.c calc.tab.h calc.lex.c a.out
