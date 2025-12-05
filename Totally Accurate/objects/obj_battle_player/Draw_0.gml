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

// Use current_sprite instead of sprite_index
draw_sprite_ext(current_sprite, image_index, x + sprite_offset, y, 1, 1, 0, c_white, _alpha)

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

// Draw name above sprite 
draw_set_halign(fa_center)
draw_set_font(-1)
var _name_scale = 0.6  
draw_text_transformed(x, y - 70, data.name, _name_scale, _name_scale, 0)  
draw_set_halign(fa_left)

// HP bar below sprite (for Middle Center origin)
var _x = x - 25  // Center the bar (half of 50 width)
var _y = y + 55  // Below the sprite center
var _w = 50  
var _h = 5  

draw_sprite_stretched(spr_box, 0, _x, _y, _w, _h)
draw_sprite_stretched_ext(spr_box, 1, _x, _y, _w * (data.displayed_hp / data.hp_total), _h, c_green, 1)