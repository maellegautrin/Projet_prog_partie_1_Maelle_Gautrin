{
open Parser        (* The type token is defined in parser.mli *)
exception Eof
}
rule token = parse
    [' ' '\t']     { token lexbuf }     (* skip blanks *)
    | ['\n' ]        { EOL }
    | ['0'-'9']+ as lxm { INT(int_of_string lxm) }
    | '+'            { PLUSINT }
    | "+."           { PLUSFLOAT }
    | '-'            { MINUSINT }
    | "-."           { MINUSFLOAT }
    | '*'            { TIMESINT }
    | "*."           { TIMESFLOAT }
    | '/'            { DIV }
    | "%"            { MOD }	
    | '('            { LPAREN }
    | ')'            { RPAREN }
    | '.'	     { DOT }
    | "int"          { E }
    | "float"        { F }
    | eof            { raise Eof }
