%{  
    #include <stdlib.h>
    #include "sintatico.tab.h"
    
%}

%%

"+" {return ADD;}
"-" {return SUB;}
"*" {return MUL;}
"/" {return DIV;}
"|" {return ABS;}
"(" {return OP;}
")" {return CP;}
"//".* {return CMT;}
[0-9]+ {yylval = atoi(yytext); return NUMBER;}
0x[a-f0-9]+ {yylval = strtol(yytext, NULL, 16); return HEXNUMBER;}
\n {return EOL;}
[ \t] { }
. {printf("Caractere desconhecido!");}

%%

