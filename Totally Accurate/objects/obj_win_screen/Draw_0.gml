draw_set_color(c_white)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

// Victory text
draw_set_font(fnt_menu)
draw_text(room_width/2, room_height/2 - 20, "VICTORY!")

// Instruction
draw_set_font(-1)
draw_text(room_width/2, room_height/2 + 20, "Press SPACE to continue")

draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white)