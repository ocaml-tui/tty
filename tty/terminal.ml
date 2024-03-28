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

(** Return the dimensions of the active terminal as [Ok (rows, columns)] or
    an error if unavailable:
     - [Error `Interrupted] : Reading from STDIN was interrupted.
     - [Error `Retry] : STDIN temporarily unavailable.
     - [Error `Unsupported] : The terminal doesn't support XTWINOPS. Try
        [get_terminal_size ~legacy:true ()], but be aware that this method
        over-writes any saved cursor position.
     - [Error `Unknown] *)
let get_terminal_size ?(legacy = false) () =
  let buf = Bytes.create 12 in
  let stdin_fd = Unix.descr_of_in_channel stdin in
  if legacy then (
    Escape_seq.save_cursor_position_seq ();
    Escape_seq.cursor_position_seq 999 999 ();
    Escape_seq.report_cursor_position_seq ();
    Escape_seq.restore_cursor_position_seq ())
  else Escape_seq.report_textarea_size_seq ();
  let ready, _, _ = Unix.select [ stdin_fd ] [] [] 0.01 in
  if ready = [] then Error `Unsupported
  else
    match Unix.read stdin_fd buf 0 12 with
    | exception Unix.(Unix_error (EINTR, _, _)) -> Error `Interrupted
    | exception Unix.(Unix_error (EAGAIN, _, _)) -> Error `Retry
    | exception Unix.(Unix_error (EWOULDBLOCK, _, _)) -> Error `Unsupported
    | exception _ -> Error `Unknown
    | len -> (
        let parts =
          Bytes.sub buf 2 (len - 3) (* drop the trailing 't' or 'R' *)
          |> Bytes.to_string |> String.split_on_char ';'
        in
        match parts with
        | [ "8"; rows; cols ] -> Ok (int_of_string rows, int_of_string cols)
        | [ rows; cols ] -> Ok (int_of_string rows, int_of_string cols)
        | _ -> Error `Unsupported)
