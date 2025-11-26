action = function(){
    // Recreate the enemy if running away
    if(instance_exists(obj_battle_switcher)) {
        instance_create_depth(obj_battle_switcher.enemy_x, obj_battle_switcher.enemy_y, 0, obj_battle_switcher.enemy_object)
    }
    room_goto(obj_battle_switcher.original_room)
}