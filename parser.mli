type token =
  | INT of (int)
  | FLOAT of (float)
  | PLUSINT
  | PLUSFLOAT
  | MINUSINT
  | MINUSFLOAT
  | TIMESINT
  | TIMESFLOAT
  | MOD
  | DIV
  | E
  | F
  | LPAREN
  | RPAREN
  | EOL

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Asyntax.expr
