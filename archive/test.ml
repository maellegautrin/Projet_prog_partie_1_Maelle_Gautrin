open Format
open X86_64


type expr= Varint of int | Varfloat of float | Plus of expr | Moins of expr |Par of expr | Ent of expr | Flot of expr |
Plusint of expr*expr | Mutlint of expr*expr | Sousint of expr*expr | Divint of expr*expr | Mod of expr*expr |
Plusflot of expr*expr | Multint of expr*expr | Moinsint of expr*expr;;

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
