%{  
    #include <stdlib.h>
    #include "sintatico.tab.h"
    int yyval;
%}

%%

"+" {return ADD;}
"-" {return SUB;}
"*" {return MUL;}
"/" {return DIV;}
"|" {return ABS;}
"(" {return OP;}
")" {return CP;}

[0-9]+ {yyval = atoi(yytext); return NUMBER;}
\n {return EOL;}
[ \t] { }
. {printf("Caractere desconhecido!");}

%%

