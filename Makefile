compile:
	flex lexer.l
	bison -dy parser.y
	g++ y.tab.c lex.yy.c


run: 
	./a.out

clean:
	rm *.o *.out 
