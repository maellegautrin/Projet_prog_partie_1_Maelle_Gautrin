open Format
open X86_64


type expr= Varint of int | Varfloat of float | Plus of expr | Moins of expr |Par of expr | Ent of expr | Flot of expr |
           Plusint of expr*expr | Multint of expr*expr | Sousint of expr*expr | Divint of expr*expr | Mod of expr*expr |
           Plusflot of expr*expr | Multflot of expr*expr | Moinsflot of expr*expr;;

(*int*)
let aff_int()=
  let code= {text=
               globl "main" ++ label "main" ++
               movq (imm 12) (reg rdi) ++
               call "print_int" ++
               ret ++
               inline "
    print_int:
        movq %rdi, %rsi
        movq $S_int,%rdi
        xorq %rax, %rax
        call printf 
        ret
        ";
             data=
               label "S_int" ++ string "%d";} in 
  let c= open_out "print12.s" in 
  let fmt = formatter_of_out_channel c in 
  X86_64.print_program fmt code;
  close_out c

(*addition int*)
let add_int()=
  let code= {text=
               globl "main" ++ label "main" ++
               movq (imm 12) (reg rdi) ++
               movq (imm 56) (reg rsi) ++
               addq (reg rsi) (reg rdi) ++
               movq (reg rdi) (reg rax) ++
               call "print_int" ++
               ret ++

               inline "
    print_int:
        movq %rdi, %rsi
        movq $S_int,%rdi
        xorq %rax, %rax
        call printf 
        ret
        ";
             data=
               label "S_int" ++ string "%d";} in 
  let c= open_out "print12.s" in 
  let fmt = formatter_of_out_channel c in 
  X86_64.print_program fmt code;
  close_out c


(*soustraction int*)

let sous_int()=
  let code= {text=
               globl "main" ++ label "main" ++
               movq (imm 12) (reg rdi) ++
               movq (imm 56) (reg rsi) ++
               subq (reg rsi) (reg rdi) ++
               movq (reg rdi) (reg rax) ++
               call "print_int" ++
               ret ++

               inline "
    print_int:
        movq %rdi, %rsi
        movq $S_int,%rdi
        xorq %rax, %rax
        call printf 
        ret
        ";
             data=
               label "S_int" ++ string "%d";} in 
  let c= open_out "print12.s" in 
  let fmt = formatter_of_out_channel c in 
  X86_64.print_program fmt code;
  close_out c
 
 (*multiplication*)

let mult_int()=
  let code= {text=
               globl "main" ++ label "main" ++
               movq (imm 12) (reg rdi) ++
               movq (imm 56) (reg rsi) ++
               imulq (reg rsi) (reg rdi) ++
               movq (reg rdi) (reg rax) ++
               call "print_int" ++
               ret ++

               inline "
    print_int:
        movq %rdi, %rsi
        movq $S_int,%rdi
        xorq %rax, %rax
        call printf 
        ret
        ";
             data=
               label "S_int" ++ string "%d";} in 
  let c= open_out "print12.s" in 
  let fmt = formatter_of_out_channel c in 
  X86_64.print_program fmt code;
  close_out c

let x = mult_int()
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

let exp_to_s expr= 
  let code= {text=
               globl "main" ++ label "main" ++
               (auxmain expr);
             data=
               label (auxdata expr);} in 
  let c= open_out "print_exp.s" in 
  let fmt = formatter_of_out_channel c in 
  X86_64.print_program fmt code;
  close_out c;;

let rec auxmain expr= match expr with 
  |Plusint(exp1,exp2)-> (auxmain exp1) ++
                        movq (reg rax) (reg r13) ++
                        (auxmain exp2) ++
                        movq (reg rax) (reg r14) ++
                        addq (reg r13) (reg r14);
  |Moinsint(exp1,exp2)->(auxmain exp1) ++
                        movq (reg rax) (reg r13) ++
                        (auxmain exp2) ++
                        movq (reg rax) (reg r14) ++
                        subq (reg r13) (reg r14);
  |Multint(exp1,exp2)-> (auxmain exp1) ++
                        movq (reg rax) (reg r13) ++
                        (auxmain exp2) ++
                        movq (reg rax) (reg r14) ++
                        imulq (reg r13) (reg r14);
  |Varint(a)-> movq (imm a) (reg rax);
  |Plus(exp1)-> auxmain exp1;
  |Moins(exp1)-> (auxmain exp1) ++
                 subq (imm 0) (reg rax);
                          
             
  

  
  