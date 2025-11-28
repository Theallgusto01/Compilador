%{
    #include <stdio.h>
    int yylex(void);
    void yyerror(char *s);    
    
%}

%token NUMBER HEXNUMBER
%token ADD SUB MUL DIV ABS
%token OP CP
%token EOL
%token CMT

%%



calclist: 
    | calclist exp EOL {printf ("= %d\n", $2);}

    ;

exp: factor
    | exp ADD factor {$$ = $1 + $3;}
    | exp SUB factor {$$ = $1 - $3;}
    ;
factor: term
    | factor MUL term {$$ = $1 * $3;}
    | factor DIV term {$$ = $1 / $3;}
    ;

term: NUMBER
    | HEXNUMBER
    | ABS term { $$ = $2 >= 0? $2 : - $2;}
    | OP exp CP { $$ = $2;}
    ;


%%

int main(int argc, char **argv){
    return yyparse();
}

void yyerror(char *s){
    fprintf(stderr, "error: %s\n", s);

}