if(instance_exists(obj_dialogue)) exit

var _hor = keyboard_check(vk_right) - keyboard_check(vk_left);
var _ver = keyboard_check(vk_down) - keyboard_check(vk_up);


if(_hor != 0 || _ver != 0) {
    
    sprite_index = spr_zulu_walk
    
   
    if(_hor < 0) {
        image_xscale = -1  // Face left
    } else if(_hor > 0) {
        image_xscale = 1   // Face right
    }
    
} else {
    sprite_index = spr_zulu_idle
}

x += _hor * move_speed;
y += _ver * move_speed;

if(hp <= 0){
    game_restart()
}

// Restore party_charge from battle if switcher exists
if(instance_exists(obj_battle_switcher)) {
    party_charge = obj_battle_switcher.party_charge_data
}


// move_and_collide(_hor * move_speed, _ver * move_speed, obj_wall, undefined, undefined, undefined, move_speed, move_speed);