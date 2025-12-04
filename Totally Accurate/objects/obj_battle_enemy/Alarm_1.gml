sprite_offset += 2 // Return to original position
if(sprite_offset < 0){
    alarm[1] = 1
} else {
    // Return to idle sprite
    current_sprite = data.sprite_index
}