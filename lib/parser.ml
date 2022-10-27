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
  | INTFUN
  | FLOATFUN
  | DIV
  | E
  | F
  | DOT
  | LPAREN
  | RPAREN
  | EOL

open Parsing;;
let _ = parse_error;;
let yytransl_const = [|
  259 (* PLUSINT *);
  260 (* PLUSFLOAT *);
  261 (* MINUSINT *);
  262 (* MINUSFLOAT *);
  263 (* TIMESINT *);
  264 (* TIMESFLOAT *);
  265 (* MOD *);
  266 (* INTFUN *);
  267 (* FLOATFUN *);
  268 (* DIV *);
  269 (* E *);
  270 (* F *);
  271 (* DOT *);
  272 (* LPAREN *);
  273 (* RPAREN *);
  274 (* EOL *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* FLOAT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\002\000\002\000\000\000"

let yylen = "\002\000\
\002\000\001\000\003\000\001\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\004\000\004\000\004\000\004\000\003\000\
\002\000\002\000\002\000\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\002\000\004\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\021\000\000\000\000\000\000\000\019\000\
\020\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\
\000\000\000\000\000\000\003\000\000\000\000\000\000\000\000\000\
\009\000\010\000\016\000\011\000\014\000\015\000\012\000\013\000"

let yydgoto = "\002\000\
\012\000\013\000"

let yysindex = "\010\000\
\021\255\000\000\000\000\000\000\252\254\253\254\029\255\012\255\
\021\255\021\255\021\255\000\000\035\255\021\255\021\255\000\000\
\000\000\021\255\021\255\152\255\152\255\077\255\021\255\021\255\
\021\255\021\255\021\255\021\255\021\255\021\255\000\000\092\255\
\107\255\122\255\137\255\000\000\158\255\158\255\158\255\158\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\242\254\246\254\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\045\255\051\255\055\255\061\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\247\255"

let yytablesize = 170
let yytable = "\020\000\
\021\000\022\000\017\000\017\000\032\000\033\000\018\000\018\000\
\034\000\035\000\001\000\014\000\015\000\037\000\038\000\039\000\
\040\000\041\000\042\000\043\000\044\000\003\000\004\000\005\000\
\006\000\007\000\008\000\019\000\000\000\016\000\017\000\000\000\
\000\000\009\000\010\000\000\000\011\000\023\000\024\000\025\000\
\026\000\027\000\028\000\029\000\018\000\000\000\030\000\005\000\
\005\000\005\000\005\000\000\000\031\000\006\000\006\000\006\000\
\006\000\007\000\007\000\007\000\007\000\005\000\005\000\008\000\
\008\000\008\000\008\000\006\000\006\000\000\000\000\000\007\000\
\007\000\000\000\000\000\000\000\000\000\008\000\008\000\023\000\
\024\000\025\000\026\000\027\000\028\000\029\000\000\000\000\000\
\030\000\000\000\000\000\000\000\000\000\036\000\023\000\024\000\
\025\000\026\000\027\000\028\000\029\000\000\000\000\000\030\000\
\000\000\000\000\000\000\000\000\045\000\023\000\024\000\025\000\
\026\000\027\000\028\000\029\000\000\000\000\000\030\000\000\000\
\000\000\000\000\000\000\046\000\023\000\024\000\025\000\026\000\
\027\000\028\000\029\000\000\000\000\000\030\000\000\000\000\000\
\000\000\000\000\047\000\023\000\024\000\025\000\026\000\027\000\
\028\000\029\000\000\000\000\000\030\000\000\000\000\000\000\000\
\000\000\048\000\023\000\024\000\025\000\026\000\027\000\028\000\
\029\000\000\000\000\000\030\000\027\000\028\000\029\000\000\000\
\000\000\030\000"

let yycheck = "\009\000\
\010\000\011\000\017\001\018\001\014\000\015\000\017\001\018\001\
\018\000\019\000\001\000\016\001\016\001\023\000\024\000\025\000\
\026\000\027\000\028\000\029\000\030\000\001\001\002\001\003\001\
\004\001\005\001\006\001\016\001\255\255\001\001\002\001\255\255\
\255\255\013\001\014\001\255\255\016\001\003\001\004\001\005\001\
\006\001\007\001\008\001\009\001\016\001\255\255\012\001\003\001\
\004\001\005\001\006\001\255\255\018\001\003\001\004\001\005\001\
\006\001\003\001\004\001\005\001\006\001\017\001\018\001\003\001\
\004\001\005\001\006\001\017\001\018\001\255\255\255\255\017\001\
\018\001\255\255\255\255\255\255\255\255\017\001\018\001\003\001\
\004\001\005\001\006\001\007\001\008\001\009\001\255\255\255\255\
\012\001\255\255\255\255\255\255\255\255\017\001\003\001\004\001\
\005\001\006\001\007\001\008\001\009\001\255\255\255\255\012\001\
\255\255\255\255\255\255\255\255\017\001\003\001\004\001\005\001\
\006\001\007\001\008\001\009\001\255\255\255\255\012\001\255\255\
\255\255\255\255\255\255\017\001\003\001\004\001\005\001\006\001\
\007\001\008\001\009\001\255\255\255\255\012\001\255\255\255\255\
\255\255\255\255\017\001\003\001\004\001\005\001\006\001\007\001\
\008\001\009\001\255\255\255\255\012\001\255\255\255\255\255\255\
\255\255\017\001\003\001\004\001\005\001\006\001\007\001\008\001\
\009\001\255\255\255\255\012\001\007\001\008\001\009\001\255\255\
\255\255\012\001"

let yynames_const = "\
  PLUSINT\000\
  PLUSFLOAT\000\
  MINUSINT\000\
  MINUSFLOAT\000\
  TIMESINT\000\
  TIMESFLOAT\000\
  MOD\000\
  INTFUN\000\
  FLOATFUN\000\
  DIV\000\
  E\000\
  F\000\
  DOT\000\
  LPAREN\000\
  RPAREN\000\
  EOL\000\
  "

let yynames_block = "\
  INT\000\
  FLOAT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 12 "parser.mly"
                            ( _1 )
# 168 "parser.ml"
               : Asyntax.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 15 "parser.mly"
                                     (Asyntax.Varint(_1))
# 175 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 16 "parser.mly"
                                     (_2)
# 182 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 17 "parser.mly"
                                     (Asyntax.Varfloat(_1))
# 189 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 18 "parser.mly"
                                     (Asyntax.Plusint(_1,_3))
# 197 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 19 "parser.mly"
                                     (Asyntax.Plusflot(_1,_3))
# 205 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 20 "parser.mly"
                                     (Asyntax.Sousint(_1,_3))
# 213 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 21 "parser.mly"
                                     (Asyntax.Sousflot(_1,_3))
# 221 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 22 "parser.mly"
                                     (Asyntax.Multint(_1,_3))
# 229 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 23 "parser.mly"
                                     (Asyntax.Multflot(_1,_3))
# 237 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 24 "parser.mly"
                                     (Asyntax.Divint(_1,_3))
# 245 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 25 "parser.mly"
                                     (Asyntax.Moinsi(_3))
# 252 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 26 "parser.mly"
                                     (Asyntax.Moinsf(_3))
# 259 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 27 "parser.mly"
                                     (Asyntax.Plusi(_3))
# 266 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 28 "parser.mly"
                                     (Asyntax.Plusf(_3))
# 273 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 29 "parser.mly"
                                     (Asyntax.Mod(_1,_3))
# 281 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 30 "parser.mly"
                                     (Asyntax.Ent(_2))
# 288 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 31 "parser.mly"
                                     (Asyntax.Flot(_2))
# 295 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 32 "parser.mly"
                                     (Asyntax.Moinsi(Asyntax.Varint(_2)))
# 302 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 33 "parser.mly"
                                     (Asyntax.Moinsf(Asyntax.Varfloat(_2)))
# 309 "parser.ml"
               : 'expr))
(* Entry main *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let main (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Asyntax.expr)
