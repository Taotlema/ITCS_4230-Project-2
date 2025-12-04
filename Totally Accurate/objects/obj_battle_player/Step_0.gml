// Check if mouse is hovering over ally during targeting
if(obj_battle_manager.targeting_mode && obj_battle_manager.targeting_type == "ally" && data.hp > 0) {
    if(position_meeting(mouse_x, mouse_y, id)) {
        is_hovered = true
        
        // Click to select target
        if(mouse_check_button_pressed(mb_left)) {
            obj_battle_manager.execute_attack(party_index)
        }
    } else {
        is_hovered = false
    }
} else {
    is_hovered = false
}

// Fade out flash effect
if(flash_alpha > 0) {
    flash_alpha -= 0.05
}

// Smooth HP bar animation
if(data.displayed_hp != data.hp) {
    data.displayed_hp = lerp(data.displayed_hp, data.hp, 0.15)
    
    if(abs(data.displayed_hp - data.hp) < 0.5) {
        data.displayed_hp = data.hp
    }
}

// Handle animation timer
if(animation_timer > 0) {
    animation_timer--
    if(animation_timer == 0) {
        // Return to idle
        current_sprite = data.sprite
    }
}