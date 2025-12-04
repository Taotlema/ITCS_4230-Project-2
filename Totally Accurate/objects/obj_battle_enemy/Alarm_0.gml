sprite_offset -= 2
if(sprite_offset < -20){
    alarm[1] = 1
    
    // Switch to attack sprite
    if(variable_struct_exists(data, "sprite_attack")) {
        current_sprite = data.sprite_attack
        image_index = 0
    }
} else {
    alarm[0] = 1
}