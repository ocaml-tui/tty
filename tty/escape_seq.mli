val csi : string
val reset_seq : string
val bold_seq : string
val faint_seq : string
val italics_seq : string
val underline_seq : string
val blink_seq : string
val reverse_seq : string
val cross_out_seq : string
val overline_seq : string
val foreground_seq : string
val background_seq : string
val alt_screen_seq : unit -> unit
val change_scrolling_region_seq : int -> int -> unit -> unit
val cursor_back_seq : int -> unit -> unit
val cursor_down_seq : int -> unit -> unit
val cursor_forward_seq : int -> unit -> unit
val cursor_horizontal_seq : int -> unit -> unit
val cursor_next_line_seq : int -> unit -> unit
val cursor_position_seq : int -> int -> unit -> unit
val cursor_previous_line_seq : int -> unit -> unit
val cursor_up_seq : int -> unit -> unit
val delete_line_seq : int -> unit -> unit
val disable_bracketed_paste_seq : unit -> unit
val disable_mouse_all_motion_seq : unit -> unit
val disable_mouse_cell_motion_seq : unit -> unit
val disable_mouse_extended_mode_seq : unit -> unit
val disable_mouse_hilite_seq : unit -> unit
val disable_mouse_pixels_mode_seq : unit -> unit
val disable_mouse_press_seq : unit -> unit
val disable_mouse_seq : unit -> unit
val enable_bracketed_paste_seq : unit -> unit
val enable_mouse_all_motion_seq : unit -> unit
val enable_mouse_cell_motion_seq : unit -> unit
val enable_mouse_extended_mode_seq : unit -> unit
val enable_mouse_hilite_seq : unit -> unit
val enable_mouse_pixels_mode_seq : unit -> unit
val enable_mouse_press_seq : unit -> unit
val enable_mouse_seq : unit -> unit
val end_bracketed_paste_seq : unit -> unit
val erase_display_seq : int -> unit -> unit
val erase_entire_line_seq : unit -> unit
val erase_line_left_seq : unit -> unit
val erase_line_right_seq : unit -> unit
val erase_line_seq : int -> unit -> unit
val exit_alt_screen_seq : unit -> unit
val hide_cursor_seq : unit -> unit
val insert_line_seq : int -> unit -> unit
val restore_cursor_position_seq : unit -> unit
val restore_screen_seq : unit -> unit
val save_cursor_position_seq : unit -> unit
val save_screen_seq : unit -> unit
val scroll_down_seq : int -> unit -> unit
val scroll_up_seq : int -> unit -> unit
val set_background_color_seq : string -> unit -> unit
val set_cursor_color_seq : string -> unit -> unit
val set_foreground_color_seq : string -> unit -> unit
val set_window_title_seq : string -> unit -> unit
val show_cursor_seq : unit -> unit
val start_bracketed_paste_seq : unit -> unit
