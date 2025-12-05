var margin = 48;
var line_spacing = 8;

var box_x = 0;
var box_y = display_get_gui_height() * 0.7;
var box_w = display_get_gui_width();
var box_h = display_get_gui_height() - box_y;

draw_set_color(c_orange);
draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, false);

var text_x = box_x + margin;
var text_y = box_y + margin;

draw_set_font(fnt_text);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _name = messages[current_message].name;
draw_set_color(global.char_colors[$ _name]);
draw_text(text_x, text_y, _name);
draw_set_color(c_white);

text_y += string_height(_name) + 8;

var wrap_width = box_w - margin * 2;

var message = draw_message;
var words = string_split(message, " ");
var line = "";

for (var i = 0; i < array_length(words); i++) {
    var word = words[i];
    if (string_width(line + word + " ") > wrap_width) {
        draw_text(text_x, text_y, line);
        text_y += string_height(line) + line_spacing;
        line = word + " ";
    } else {
        line += word + " ";
    }
}

if (line != "") {
    draw_text(text_x, text_y, line);
}
