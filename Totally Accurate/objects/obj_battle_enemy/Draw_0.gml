// Highlight if hovered during targeting
var _alpha = 1;
if (is_hovered) {
    _alpha = 0.7;
}

// Draw only if the sprite is valid
if (sprite_exists(current_sprite)) {
    draw_sprite_ext(
        current_sprite,
        image_index,
        x + sprite_offset,
        y,
        1,
        1,
        0,
        c_white,
        _alpha
    );
}

// Draw targeting indicator
if (is_hovered && obj_battle_manager.targeting_mode) {
    draw_set_color(c_yellow);
    draw_rectangle(x - 5, y - 5, x + sprite_width + 5, y + sprite_height + 5, true);
    draw_set_color(c_white);
}

// HP bar
var _x = x + (sprite_width / 2) - 25;
var _y = y + sprite_height + 1;
var _w = 50;
var _h = 5;

draw_sprite_stretched(spr_box, 0, _x, _y, _w, _h);
draw_sprite_stretched_ext(spr_box, 1, _x, _y, _w * (displayed_hp / data.hp_total), _h, c_red, 1);
