compile: lexico.l sintatico.y 
	   flex lexico.l
	   bison -d sintatico.y
	   gcc -o $@ sintatico.tab.c lex.yy.c -lfl
