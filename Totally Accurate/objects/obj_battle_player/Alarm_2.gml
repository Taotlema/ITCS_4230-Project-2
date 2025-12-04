// Switch to hurt sprite
if(variable_struct_exists(data, "sprite_hurt")) {
    current_sprite = data.sprite_hurt
    image_index = 0
    animation_timer = 20  // Show hurt animation for 20 frames
}