open Format
open X86_64

type expr =
  | Varint of int
  | Varfloat of float
  | Plus of expr
  | Moins of expr
  | Ent of expr
  | Flot of expr
  | Plusint of expr * expr
  | Multint of expr * expr
  | Sousint of expr * expr
  | Divint of expr * expr
  | Mod of expr * expr
  | Plusflot of expr * expr
  | Multflot of expr * expr
  | Sousflot of expr * expr
let test= Plusint(Varint(3),Plusint(Varint(2),Varint(3)));;
(*int*)
let aff_int () =
  let code =
    {
      text =
        globl "main" ++ label "main"
        ++ movq (imm 12) (reg rdi)
        ++ call "print_int" ++ ret
        ++ inline
             "\n\
             \    print_int:\n\
             \        movq %rdi, %rsi\n\
             \        movq $S_int,%rdi\n\
             \        xorq %rax, %rax\n\
             \        call printf\n\
             \        ret\n\
             \        ";
      data = label "S_int" ++ string "%d";
    }
  in
  let c = open_out "print12.s" in
  let fmt = formatter_of_out_channel c in
  X86_64.print_program fmt code;
  close_out c

(*addition int*)
let add_int () =
  let code =
    {
      text =
        globl "main" ++ label "main"
        ++ movq (imm 12) (reg rdi)
        ++ movq (imm 56) (reg rsi)
        ++ addq (reg rsi) (reg rdi)
        ++ movq (reg rdi) (reg rax)
        ++ call "print_int" ++ ret
        ++ inline
             "\n\
             \    print_int:\n\
             \        movq %rdi, %rsi\n\
             \        movq $S_int,%rdi\n\
             \        xorq %rax, %rax\n\
             \        call printf\n\
             \        ret\n\
             \        ";
      data = label "S_int" ++ string "%d";
    }
  in
  let c = open_out "print12.s" in
  let fmt = formatter_of_out_channel c in
  X86_64.print_program fmt code;
  close_out c

(*soustraction int*)

(*addition float*)
(*
let add_float()=
    let code= {text=
        globl "main" ++ label "main" ++
        movsd (val1) (reg xmm0) ++
        addsd (val2) (reg xmm0) ++
        call "print_double" ++
        ret ++
        label "print_double" ++
        mov (immm message) (reg rdi)
        mov (imm 1) (reg rax)
        call "printf" ++
        ret ++
    inline "
        .data

    val1 : .double 0.2
    val2 : .double 0.22"} in
    let c= open_out "print12.s" in
    let fmt = formatter_of_out_channel c in
    X86_64.print_program fmt code;
    close_out c
*)

(*le*t exp_to_s expr=
  let code= {text=
               globl "main" ++ label "main" ++
               (auxmain expr);
             data=
               label (auxdata expr);} in
  let c= open_out "print_exp.s" in
  let fmt = formatter_of_out_channel c in
  X86_64.print_program fmt code;
  close_out c;;*)

let fin =
  inline
    "\n\
    \        print_int:\n\
    \            movq %rax, %rsi\n\
    \            movq $S_int,%rdi\n\
    \            xorq %rax, %rax\n\
    \            call printf\n\
    \            ret\n\
    \        "
  ++ inline
       "\n\
       \        print_double:\n\
       \            mov $S_int, %rdi\n\
       \            mov $1, %rax\n\
       \            call printf \n\
       \            ret\n"

let exp_main expr =
  let i = ref 0 in
  let l = ref nop in
  let rec auxmain expr =
    match expr with
    | Plusint (exp1, exp2) ->
        auxmain exp1
        ++ pushq (reg rax)
        ++ auxmain exp2 ++ popq rcx
        ++ addq (reg rcx) (reg rax)
    | Sousint (exp1, exp2) ->
        auxmain exp1
        ++ pushq (reg rax)
        ++ auxmain exp2 ++ popq rcx
        ++ subq (reg rcx) (reg rax)
    | Multint (exp1, exp2) ->
        auxmain exp1
        ++ pushq (reg rax)
        ++ auxmain exp2 ++ popq rcx
        ++ imulq (reg rcx) (reg rax)
    | Varint a -> movq (imm a) (reg rax)
    | Plus exp1 -> auxmain exp1
    | Moins exp1 -> auxmain exp1 ++ subq (imm 0) (reg rax)
    | Varfloat a ->  l:=  !l ++ inline ("val"^string_of_int !i ^ " : .double" ^string_of_float a);
        incr i;
	inline("movsd (val"^string_of_int(!i)^"), %xmm0");
	
    | Plusflot (exp1, exp2) ->
        auxmain exp1
        ++ pushsd (reg xmm0)
        ++ auxmain exp2
        ++ popsd (xmm1)
        ++ addsd (reg xmm1) (reg xmm0)
    | Sousflot (exp1, exp2) ->
        auxmain exp1
        ++ pushsd (reg xmm0)
        ++ auxmain exp2
        ++ popsd (xmm1)
        ++ subsd (reg xmm1) (reg xmm0)
    | Multflot (exp1, exp2) ->
        auxmain exp1
        ++ pushsd (reg xmm0)
        ++ auxmain exp2
        ++ popsd (xmm1)
        ++ imulsd (reg xmm1) (reg xmm0)
    | Divint (exp1, exp2) ->
        auxmain exp1
        ++ pushq (reg rax)
        ++ auxmain exp2
        ++ popq (rdi) 
        ++ movq (reg rax) (reg rsi)
        ++ idivq (reg rsi)
    | Mod (exp1, exp2) ->
        auxmain exp1
        ++ pushq (reg rax)
        ++ auxmain exp2
        ++ popq (rdi) 
        ++ movq (reg rax) (reg rsi)
        ++ idivq (reg rsi)
        ++ movq (reg rax) (reg rdx)
    | _ -> failwith "todo"
  in
  let est_int = ref true in
  match expr with
  | Plusflot _ -> est_int := false
  | Sousflot _ -> est_int := false
  | Multflot _ -> est_int := false
  | Varfloat _ ->est_int:=false
  |_-> ();
      let code =
        {
          text =
            globl "main" ++ label "main" ++ auxmain expr
            ++ (if !est_int then call " print_int" else call "print_float")
            ++ ret ++ fin; data
            = label "S_int" ++ string "%d" ++ !l;
        }
      in
      let c = open_out "print_exp.s" in
      let fmt = formatter_of_out_channel c in
      X86_64.print_program fmt code;
      close_out c;;
exp_main test;;
