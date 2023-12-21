type t = private
  | RGB of int * int * int
  | ANSI of int
  | ANSI256 of int
  | No_color

val make : string -> t
val of_rgb : int * int * int -> t
val pp : Format.formatter -> t -> unit

exception Invalid_color of string
exception Invalid_color_param of string
exception Invalid_color_num of string * int

val no_color : t
val is_no_color : t -> bool
val is_rgb : t -> bool
val is_ansi : t -> bool
val is_ansi256 : t -> bool
val to_escape_seq : mode:[> `bg | `fg ] -> t -> string
