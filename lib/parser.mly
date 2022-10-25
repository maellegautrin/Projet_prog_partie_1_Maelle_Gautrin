%token <int> INT
%token PLUSINT PLUSFLOAT MINUSINT MINUSFLOAT TIMESINT TIMESFLOAT MOD INTFUN FLOATFUN DIV
%token LPAREN RPAREN
%token EOL
%left PLUS MINUS        /* lowest precedence */
%left TIMES DIV         /* medium precedence */
%nonassoc UMINUS        /* highest precedence */
%start main             /* the entry point */
%type <int> main
%%
main:
    expr EOL                { $1 }
;
expr:
    INT                     { $1 }
    | LPAREN expr RPAREN      { $2 }
    | expr  DOT expr          { $1.$3 }
    | expr PLUS expr          { $1 + $3 }
    | expr MINUS expr         { $1 - $3 }
    | expr TIMES expr         { $1 * $3 }
    | expr DIV expr           { $1 / $3 }
    | MINUS expr %prec UMINUS { - $2 }
;
