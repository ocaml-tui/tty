let csi = "\x1b["
let reset_seq = "0"
let bold_seq = "1"
let faint_seq = "2"
let italics_seq = "3"
let underline_seq = "4"
let blink_seq = "5"
let reverse_seq = "7"
let cross_out_seq = "9"
let overline_seq = "53"
let foreground_seq = "38"
let background_seq = "48"
let escape code () = Printf.printf "%s%s%!" csi code

(* Cursor positioning. *)
let cursor_up_seq x = escape (Printf.sprintf "%dA" x)
let cursor_down_seq x = escape (Printf.sprintf "%dB" x)
let cursor_forward_seq x = escape (Printf.sprintf "%dC" x)
let cursor_back_seq x = escape (Printf.sprintf "%dD" x)
let cursor_next_line_seq x = escape (Printf.sprintf "%dE" x)
let cursor_previous_line_seq x = escape (Printf.sprintf "%dF" x)
let cursor_horizontal_seq x = escape (Printf.sprintf "%dG" x)
let cursor_position_seq x y = escape (Printf.sprintf "%d;%dH" x y)
let erase_display_seq x = escape (Printf.sprintf "%dJ" x)
let erase_line_seq x = escape (Printf.sprintf "%dK" x)
let scroll_up_seq x = escape (Printf.sprintf "%dS" x)
let scroll_down_seq x = escape (Printf.sprintf "%dT" x)
let save_cursor_position_seq = escape "s"
let restore_cursor_position_seq = escape "u"
let change_scrolling_region_seq x y = escape (Printf.sprintf "%d;%dr" x y)
let insert_line_seq x = escape (Printf.sprintf "%dL" x)
let delete_line_seq x = escape (Printf.sprintf "%dM" x)

(* Explicit values for EraseLineSeq. *)
let erase_line_right_seq = escape "0K"
let erase_line_left_seq = escape "1K"
let erase_entire_line_seq = escape "2K"

(* Mouse. *)
let enable_mouse_press_seq = escape "?9h"
let disable_mouse_press_seq = escape "?9l"
let enable_mouse_seq = escape "?1000h"
let disable_mouse_seq = escape "?1000l"
let enable_mouse_hilite_seq = escape "?1001h"
let disable_mouse_hilite_seq = escape "?1001l"
let enable_mouse_cell_motion_seq = escape "?1002h"
let disable_mouse_cell_motion_seq = escape "?1002l"
let enable_mouse_all_motion_seq = escape "?1003h"
let disable_mouse_all_motion_seq = escape "?1003l"
let enable_mouse_extended_mode_seq = escape "?1006h"
let disable_mouse_extended_mode_seq = escape "?1006l"
let enable_mouse_pixels_mode_seq = escape "?1016h"
let disable_mouse_pixels_mode_seq = escape "?1016l"

(* Screen. *)
let restore_screen_seq = escape "?47l"
let save_screen_seq = escape "?47h"
let alt_screen_seq = escape "?1049h"
let exit_alt_screen_seq = escape "?1049l"

(* Bracketed paste. *)
let enable_bracketed_paste_seq = escape "?2004h"
let disable_bracketed_paste_seq = escape "?2004l"
let start_bracketed_paste_seq = escape "200~"
let end_bracketed_paste_seq = escape "201~"

(* Session. *)
let set_window_title_seq s = escape (Printf.sprintf "2;%s" s)
let set_foreground_color_seq s = escape (Printf.sprintf "10;%s" s)
let set_background_color_seq s = escape (Printf.sprintf "11;%s" s)
let set_cursor_color_seq s = escape (Printf.sprintf "12;%s" s)
let show_cursor_seq = escape "?25h"
let hide_cursor_seq = escape "?25l"
