// Dim if not current turn
var _current_turn = obj_battle_manager.turn_order[obj_battle_manager.current_turn_index]
var _is_current = (_current_turn.type == "party" && _current_turn.index == party_index)
var _alpha = _is_current ? 1 : 0.5

// Dim more when hovering during ally targeting
if(is_hovered && obj_battle_manager.targeting_type == "ally") {
    _alpha = 0.7
}

// Apply white flash shader if taking damage
if(flash_alpha > 0) {
    shader_set(shd_flash_white)
    shader_set_uniform_f(shader_get_uniform(shd_flash_white, "flash_amount"), flash_alpha)
}

draw_sprite_ext(sprite_index, 0, x + sprite_offset, y, 1, 1, 0, c_white, _alpha)

// Reset shader
if(flash_alpha > 0) {
    shader_reset()
}

// Draw targeting indicator for healing
if(is_hovered && obj_battle_manager.targeting_mode && obj_battle_manager.targeting_type == "ally") {
    draw_set_color(c_lime)
    draw_rectangle(x - 5, y - 5, x + sprite_width + 5, y + sprite_height + 5, true)
    draw_set_color(c_white)
}

// Draw name above sprite (centered with sprite)
draw_set_halign(fa_center)
draw_set_font(-1)
var _name_scale = 0.5
draw_text_transformed(x + sprite_width/2, y - 12, data.name, _name_scale, _name_scale, 0)
draw_set_halign(fa_left)

// Bars below sprite (centered with sprite)
var _x = x + (sprite_width/2) - 10
var _y = y + sprite_height + 2
var _w = 20
var _h = 3

// HP bar only
draw_sprite_stretched(spr_box, 0, _x, _y, _w, _h)
draw_sprite_stretched_ext(spr_box, 1, _x, _y, _w * (data.displayed_hp / data.hp_total), _h, c_green, 1)