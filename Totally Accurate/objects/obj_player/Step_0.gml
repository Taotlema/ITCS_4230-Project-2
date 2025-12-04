if(instance_exists(obj_dialogue)) exit

var _hor = keyboard_check(vk_right) - keyboard_check(vk_left);
var _ver = keyboard_check(vk_down) - keyboard_check(vk_up);

move_and_collide(_hor * move_speed, _ver * move_speed, tilemap, undefined, undefined, undefined, move_speed, move_speed);

// Change sprite based on movement
if(_hor != 0 || _ver != 0) {
    // Moving - use walk sprite
    sprite_index = spr_zulu_walk
} else {
    // Idle - use idle sprite
    sprite_index = spr_zulu_idle
}


if(hp <= 0){
    game_restart()
}

// Restore party_charge from battle if switcher exists
if(instance_exists(obj_battle_switcher)) {
    party_charge = obj_battle_switcher.party_charge_data
}