// Show cheat input in corner (optional debug display)
if(cheat_input != "") {
    draw_set_color(c_yellow)
    draw_set_alpha(0.5)
    draw_text(10, 10, "Cheat: " + cheat_input)
    draw_set_alpha(1)
    draw_set_color(c_white)
}