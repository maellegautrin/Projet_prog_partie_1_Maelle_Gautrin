{
open Parser        (* The type token is defined in parser.mli *)
exception Eof
}
let digit = ['0'-'9']
let frac = '.' digit*
let exp = ['e' 'E'] ['-' '+']? digit+
let float = digit* frac? exp?

rule token = parse
    [' ' '\t']     { token lexbuf }     (* skip blanks *)
    | ['\n' ]        { EOL }
    | ['0'-'9']+ as lxm { INT(int_of_string lxm) }
    | float  as lxm          { FLOAT(float_of_string lxm )}
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
    | "int"          { E }
    | "float"        { F }
    | eof            { raise Eof }
