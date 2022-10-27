open Format
open Asyntax
open Lexer
open Parser
open X86_64

(* type expr =
  | Varint of int
  | Varfloat of float
  | Plusi of expr
  | Plusf of expr
  | Moinsi of expr
  | Moinsf of expr
  | Ent of expr
  | Flot of expr
  | Plusint of expr * expr
  | Multint of expr * expr
  | Sousint of expr * expr
  | Divint of expr * expr
  | Mod of expr * expr
  | Plusflot of expr * expr
  | Multflot of expr * expr
  | Sousflot of expr * expr *)

let fin =
  (*partie du code toujours présente: affichage int et float*)
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
       \            mov $S_float, %rdi\n\
       \            mov $1, %rax\n\
       \            call printf \n\
       \            ret\n"

let exp_main expr =
  let i = ref 1 in
  let l = ref nop in
  (*liste qui sert à stocker tous les éléments à ajouter au .data à la fin *)
  let rec auxmain expr =
    match expr with
    | Asyntax.Plusint (exp1, exp2) ->
        auxmain exp1
        ++ pushq (reg rax)
        ++ auxmain exp2 ++ popq rcx
        ++ addq (reg rcx) (reg rax)
    | Asyntax.Sousint (exp1, exp2) ->
        auxmain exp1
        ++ pushq (reg rax)
        ++ auxmain exp2 ++ popq rcx
        ++ subq (reg rax) (reg rcx)
    | Asyntax.Multint (exp1, exp2) ->
        auxmain exp1
        ++ pushq (reg rax)
        ++ auxmain exp2 ++ popq rcx
        ++ imulq (reg rcx) (reg rax)
    | Asyntax.Varint a -> movq (imm a) (reg rax)
    | Asyntax.Plusi exp1 -> auxmain exp1
    | Asyntax.Moinsi exp1 -> auxmain exp1 ++ subq (imm 0) (reg rax)
    | Asyntax.Varfloat a ->
        incr i;
        l :=
          !l
          ++ inline
               ("val" ^ string_of_int !i ^ " : .double " ^ string_of_float a
              ^ "\n");

        (* on définit la valeur de val i dans le .data *)
        inline ("movsd val" ^ string_of_int !i ^ "(%rip), %xmm0")
    | Asyntax.Plusflot (exp1, exp2) ->
        let ofs = -8 * !i in
        let a = movsd (reg xmm0) (ind ~ofs rsp) in
        let ofs = -8 * !i in
        let b = movsd (ind ~ofs rsp) (reg xmm1) in
        auxmain exp1 ++ inline "\n \t" ++ a ++ inline "\t" ++ auxmain exp2
        ++ inline "\t" ++ inline "\n \t" ++ b ++ inline "\t"
        ++ addsd (reg xmm1) (reg xmm0)
        ++ inline "\t"
    | Asyntax.Sousflot (exp1, exp2) ->
        let ofs = -8 * !i in
        let a = movsd (reg xmm0) (ind ~ofs rsp) in
        let ofs = -8 * !i in
        let b = movsd (ind ~ofs rsp) (reg xmm1) in
        auxmain exp1 ++ inline "\n \t" ++ a ++ inline "\t" ++ auxmain exp2
        ++ inline "\t" ++ inline "\n \t" ++ b ++ inline "\t"
        ++ subsd (reg xmm0) (reg xmm1)
        ++ movsd (reg xmm1) (reg xmm0)
    | Asyntax.Multflot (exp1, exp2) ->
        let ofs = -8 * !i in
        let a = movsd (reg xmm0) (ind ~ofs rsp) in
        let ofs = -8 * !i in
        let b = movsd (ind ~ofs rsp) (reg xmm1) in
        auxmain exp1 ++ inline "\n \t" ++ a ++ inline "\t" ++ auxmain exp2
        ++ inline "\t" ++ inline "\n \t" ++ b ++ inline "\t"
        ++ mulsd (reg xmm1) (reg xmm0)
    | Asyntax.Divint (exp1, exp2) ->
        auxmain exp1
        ++ pushq (reg rax)
        ++ auxmain exp2
        ++ movq (imm 1) (reg rdx)
        ++ movq (reg rax) (reg rsi)
        ++ popq rax
        ++ idivq (reg rsi)
    | Asyntax.Mod (exp1, exp2) ->
        auxmain exp1
        ++ pushq (reg rax)
        ++ auxmain exp2
        ++ movq (imm 0) (reg rdx)
        ++ movq (reg rax) (reg rsi)
        ++ popq rax
        ++ idivq (reg rsi)
        ++ movq (reg rdx) (reg rax)
    | _ -> failwith "todo"
  in

  let est_int expr =
    match expr with
    (* on regarde le type de l'epression finale à afficher *)
    | Asyntax.Plusflot _ -> false
    | Asyntax.Sousflot _ -> false
    | Asyntax.Multflot _ -> false
    | Asyntax.Varfloat _ -> false
    | Asyntax.Plusf _ -> false
    | Asyntax.Moinsf _ -> false
    | _ -> true
  in

  let code =
    let res_aux = auxmain expr in
    {
      text =
        globl "main" ++ label "main" ++ res_aux
        ++ (if est_int expr then call " print_int"
           else call "print_double"
             (* si c'est un float on appelle print_double, sinon on appelle print_int *))
        ++ ret ++ fin;
      (* on affiche le module de fin définit plus haut *)
      data =
        label "S_int" ++ string "%d"
        ++ (* on définit S_int et S_float dans le .data que l'expression soit float ou int *)
        label "S_float" ++ string "%lf" ++ !l;
      (* on rajoute la liste contenant les éléments du .data *)
    }
  in
  let c = open_out "bob.s" in
  (* on écrit dans le fichier en_assembleur.s *)
  let fmt = formatter_of_out_channel c in
  X86_64.print_program fmt code;
  close_out c ;;

  let lexbuf = Lexing.from_channel (open_in Sys.argv.(1)) in let ast = Parser.main Lexer.token lexbuf in (exp_main ast) ;;
