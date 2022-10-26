%token <int> INT
%token PLUSINT PLUSFLOAT MINUSINT MINUSFLOAT TIMESINT TIMESFLOAT MOD INTFUN FLOATFUN DIV E F
%token LPAREN RPAREN
%token EOL
%left PLUSINT PLUSFLOAT MINUSINT MINUSFLOAT        /* lowest precedence */
%left TIMES DIV MOD        /* medium precedence */
%nonassoc  MINUSINT MINUSFLOAT E F    /* highest precedence */
%start main             /* the entry point */
%type <Asyntax.exp> main
%%
main:
    expr EOL                { $1 }
;
expr:
    INT                     {Asyntax.Varint($1)}
    | LPAREN expr RPAREN      {Asyntax.Par($2) }
    | expr  DOT expr          {Asyntax.Varfloat($1.$3) }
    | expr PLUSINT expr          {Asyntax.Plusint($1,$3)}
    | expr PLUSFLOAT expr     {Asyntax.Plusflot($1,$3)}
    | expr MINUSINT expr         {Asyntax.Sousint($1,$3)}
    | expr MINUSFLOAT expr    {Asyntax.Sousfloat($1,$3)}
    | expr TIMESINT expr         {Asyntax.Multint($1,$3)}
    | expr TIMESFLOT expr     {Asyntax.Multfloat($1,$3)}
    | expr DIV expr           {Asyntax.Divint($1,$3)}
    | MINUSINT LPAREN expr RPAREN {Asyntax.Moinsint($3)}
    | MINUSFLOAT LPAREN expr RPAREN {Asyntax.Moinsfloat($3)}
    | PLUSINT LPAREN expr RPAREN {Asyntax.Plusint($3)}
    | PLUSFLOAT LPAREN expr RPAREN {Asyntax.Plusfloat($3)}
    | expr MOD expr        {Asyntax.Mod($1,$3)}
;   | E expr               {Asyntax.Ent($2)}
    | F expr               {Asyntax.Flot($2)}
