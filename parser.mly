%token <int> INT
%token <float> FLOAT
%token PLUSINT PLUSFLOAT MINUSINT MINUSFLOAT TIMESINT TIMESFLOAT MOD DIV E F
%token LPAREN RPAREN
%token EOL
%left PLUSINT PLUSFLOAT MINUSINT MINUSFLOAT        /* lowest precedence */
%left TIMESINT TIMESFLOAT DIV MOD        /* medium precedence */
%start main             /* the entry point */
%type <Asyntax.expr> main
%%
main:
    expr EOL                { $1 }
;
expr:
    INT                              {Asyntax.Varint($1)}                         
    | LPAREN expr RPAREN             {$2}
    | FLOAT                          {Asyntax.Varfloat($1)}
    | expr PLUSINT expr              {Asyntax.Plusint($1,$3)}
    | expr PLUSFLOAT expr            {Asyntax.Plusflot($1,$3)}
    | expr MINUSINT expr             {Asyntax.Sousint($1,$3)}
    | expr MINUSFLOAT expr           {Asyntax.Sousflot($1,$3)}
    | expr TIMESINT expr             {Asyntax.Multint($1,$3)}
    | expr TIMESFLOAT expr           {Asyntax.Multflot($1,$3)}
    | expr DIV expr                  {Asyntax.Divint($1,$3)}
    | MINUSINT LPAREN expr RPAREN    {Asyntax.Moinsi($3)}
    | MINUSFLOAT LPAREN expr RPAREN  {Asyntax.Moinsf($3)}
    | PLUSINT LPAREN expr RPAREN     {Asyntax.Plusi($3)}
    | PLUSFLOAT LPAREN expr RPAREN   {Asyntax.Plusf($3)}
    | expr MOD expr                  {Asyntax.Mod($1,$3)}
    | E LPAREN expr RPAREN           {Asyntax.E($3)}
    | F LPAREN expr RPAREN                         {Asyntax.F($3)}
    | MINUSINT INT                   {Asyntax.Moinsi(Asyntax.Varint($2))}
    | MINUSINT FLOAT                 {Asyntax.Moinsf(Asyntax.Varfloat($2))}
    ;
