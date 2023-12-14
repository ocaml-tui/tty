type t

val from_env : unit -> t
val default : t
val convert : t -> Color.t -> Color.t
