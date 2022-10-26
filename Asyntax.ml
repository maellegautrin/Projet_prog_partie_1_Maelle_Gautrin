
  type expr =
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
  | Sousflot of expr * expr;;
