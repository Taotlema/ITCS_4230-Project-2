if(instance_exists(obj_dialogue)) exit

var _hor = keyboard_check(vk_right) - keyboard_check(vk_left);
var _ver = keyboard_check(vk_down) - keyboard_check(vk_up);

move_and_collide(_hor * move_speed, _ver * move_speed, tilemap, undefined, undefined, undefined, move_speed, move_speed);

if(_hor != 0 and _ver != 0){
	if(_ver > 0) sprite_index = "walking down"
	else if (_ver < 0) sprite_index = "walking up"
	else if (_her > 0) sprite_index = "walking right"
	else if (_her < 0) sprite_index = "walking left"
}else{
	if(sprite_index == "walking right") sprite_index = "walking right idle"
	// not finished, lack sprite
}

if(hp <= 0){
	game_restart()
}