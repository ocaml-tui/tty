let clear () =
  Escape_seq.erase_display_seq 2 ();
  Escape_seq.cursor_position_seq 1 1 ()

let clear_line () = Escape_seq.erase_entire_line_seq ()
let cursor_down x = Escape_seq.cursor_down_seq x ()
let cursor_up x = Escape_seq.cursor_up_seq x ()
let cursor_back x = Escape_seq.cursor_back_seq x ()
let enter_alt_screen () = Escape_seq.alt_screen_seq ()
let exit_alt_screen () = Escape_seq.exit_alt_screen_seq ()
let move_cursor x y = Escape_seq.cursor_position_seq x y ()
