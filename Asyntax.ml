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
  | Sousflot of expr * expr;;