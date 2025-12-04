// Check if mouse is hovering over enemy during targeting
if(obj_battle_manager.targeting_mode && obj_battle_manager.targeting_type == "enemy" && data.hp > 0) {
    if(position_meeting(mouse_x, mouse_y, id)) {
        is_hovered = true
        
        // Click to select target
        if(mouse_check_button_pressed(mb_left)) {
            obj_battle_manager.execute_attack(enemy_index)
        }
    } else {
        is_hovered = false
    }
} else {
    is_hovered = false
}

// Initialize displayed_hp if not set yet
if(displayed_hp == 0 && data.hp > 0) {
    displayed_hp = data.hp
}

// Smooth HP bar animation
if(displayed_hp != data.hp) {
    displayed_hp = lerp(displayed_hp, data.hp, 0.15)
    
    // Snap to actual value when close enough
    if(abs(displayed_hp - data.hp) < 0.5) {
        displayed_hp = data.hp
    }
}

// Handle animation timer
if(animation_timer > 0) {
    animation_timer--
    if(animation_timer == 0) {
        // Return to idle
        current_sprite = data.sprite_index
    }
}

// Check for death and play death animation
if(data.hp <= 0 && current_sprite != data.sprite_death) {
    if(variable_struct_exists(data, "sprite_death")) {
        current_sprite = data.sprite_death
        image_index = 0
        image_speed = 0.5  // Control animation speed
    }
}

// Stop death animation on last frame
if(current_sprite == data.sprite_death && image_index >= image_number - 1) {
    image_speed = 0  // Stop animating
    image_index = image_number - 1  // Stay on last frame
	instance_destroy()
}