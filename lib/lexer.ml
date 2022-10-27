# 1 "lexer.mll"
 
open Parser        (* The type token is defined in parser.mli *)
exception Eof

# 7 "lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\238\255\000\000\000\000\242\255\243\255\244\255\245\255\
    \012\000\013\000\014\000\022\000\034\000\063\000\254\255\255\255\
    \073\000\088\000\250\255\248\255\246\255\015\000\240\255\022\000\
    \000\000\018\000\239\255";
  Lexing.lex_backtrk =
   "\003\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \008\000\006\000\004\000\255\255\003\000\002\000\255\255\255\255\
    \003\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255";
  Lexing.lex_default =
   "\255\255\000\000\255\255\255\255\000\000\000\000\000\000\000\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\000\000\000\000\
    \255\255\255\255\000\000\000\000\000\000\255\255\000\000\255\255\
    \255\255\255\255\000\000";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\015\000\014\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \015\000\000\000\000\000\000\000\000\000\006\000\000\000\000\000\
    \005\000\004\000\008\000\010\000\000\000\009\000\012\000\007\000\
    \013\000\013\000\013\000\013\000\013\000\013\000\013\000\013\000\
    \013\000\013\000\020\000\019\000\018\000\000\000\000\000\000\000\
    \000\000\017\000\000\000\017\000\000\000\011\000\016\000\016\000\
    \016\000\016\000\016\000\016\000\016\000\016\000\016\000\016\000\
    \000\000\000\000\012\000\012\000\012\000\012\000\012\000\012\000\
    \012\000\012\000\012\000\012\000\000\000\000\000\000\000\000\000\
    \000\000\025\000\000\000\000\000\000\000\011\000\002\000\011\000\
    \000\000\003\000\000\000\000\000\023\000\012\000\021\000\013\000\
    \013\000\013\000\013\000\013\000\013\000\013\000\013\000\013\000\
    \013\000\016\000\016\000\016\000\016\000\016\000\016\000\016\000\
    \016\000\016\000\016\000\022\000\011\000\024\000\026\000\011\000\
    \016\000\016\000\016\000\016\000\016\000\016\000\016\000\016\000\
    \016\000\016\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\011\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\255\255\255\255\255\255\000\000\255\255\255\255\
    \000\000\000\000\000\000\000\000\255\255\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\008\000\009\000\010\000\255\255\255\255\255\255\
    \255\255\011\000\255\255\011\000\255\255\000\000\011\000\011\000\
    \011\000\011\000\011\000\011\000\011\000\011\000\011\000\011\000\
    \255\255\255\255\012\000\012\000\012\000\012\000\012\000\012\000\
    \012\000\012\000\012\000\012\000\255\255\255\255\255\255\255\255\
    \255\255\024\000\255\255\255\255\255\255\000\000\000\000\012\000\
    \255\255\000\000\255\255\255\255\002\000\013\000\003\000\013\000\
    \013\000\013\000\013\000\013\000\013\000\013\000\013\000\013\000\
    \013\000\016\000\016\000\016\000\016\000\016\000\016\000\016\000\
    \016\000\016\000\016\000\021\000\013\000\023\000\025\000\012\000\
    \017\000\017\000\017\000\017\000\017\000\017\000\017\000\017\000\
    \017\000\017\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\013\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255";
  Lexing.lex_base_code =
   "";
  Lexing.lex_backtrk_code =
   "";
  Lexing.lex_default_code =
   "";
  Lexing.lex_trans_code =
   "";
  Lexing.lex_check_code =
   "";
  Lexing.lex_code =
   "";
}

let rec token lexbuf =
   __ocaml_lex_token_rec lexbuf 0
and __ocaml_lex_token_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 11 "lexer.mll"
                   ( token lexbuf )
# 135 "lexer.ml"

  | 1 ->
# 12 "lexer.mll"
                     ( EOL )
# 140 "lexer.ml"

  | 2 ->
let
# 13 "lexer.mll"
                    lxm
# 146 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 13 "lexer.mll"
                        ( INT(int_of_string lxm) )
# 150 "lexer.ml"

  | 3 ->
let
# 14 "lexer.mll"
                lxm
# 156 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 14 "lexer.mll"
                             ( FLOAT(float_of_string lxm ))
# 160 "lexer.ml"

  | 4 ->
# 15 "lexer.mll"
                     ( PLUSINT )
# 165 "lexer.ml"

  | 5 ->
# 16 "lexer.mll"
                     ( PLUSFLOAT )
# 170 "lexer.ml"

  | 6 ->
# 17 "lexer.mll"
                     ( MINUSINT )
# 175 "lexer.ml"

  | 7 ->
# 18 "lexer.mll"
                     ( MINUSFLOAT )
# 180 "lexer.ml"

  | 8 ->
# 19 "lexer.mll"
                     ( TIMESINT )
# 185 "lexer.ml"

  | 9 ->
# 20 "lexer.mll"
                     ( TIMESFLOAT )
# 190 "lexer.ml"

  | 10 ->
# 21 "lexer.mll"
                     ( DIV )
# 195 "lexer.ml"

  | 11 ->
# 22 "lexer.mll"
                     ( MOD )
# 200 "lexer.ml"

  | 12 ->
# 23 "lexer.mll"
                     ( LPAREN )
# 205 "lexer.ml"

  | 13 ->
# 24 "lexer.mll"
                     ( RPAREN )
# 210 "lexer.ml"

  | 14 ->
# 25 "lexer.mll"
               ( DOT )
# 215 "lexer.ml"

  | 15 ->
# 26 "lexer.mll"
                     ( E )
# 220 "lexer.ml"

  | 16 ->
# 27 "lexer.mll"
                     ( F )
# 225 "lexer.ml"

  | 17 ->
# 28 "lexer.mll"
                     ( raise Eof )
# 230 "lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_token_rec lexbuf __ocaml_lex_state

;;
