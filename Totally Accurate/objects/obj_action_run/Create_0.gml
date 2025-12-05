action = function(){
    // Debug - check what's happening
    if(instance_exists(obj_battle_switcher)) {
        var _count = instance_number(obj_battle_switcher)
        show_debug_message("Number of switchers: " + string(_count))
        show_debug_message("Switcher original_room: " + room_get_name(obj_battle_switcher.original_room))
    }
    
    // Recreate the enemy if running away (if enemy data exists)
    if(instance_exists(obj_battle_switcher)) {
        if(variable_instance_exists(obj_battle_switcher, "enemy_object")) {
            instance_create_depth(obj_battle_switcher.enemy_x, obj_battle_switcher.enemy_y, 0, obj_battle_switcher.enemy_object)
        }
        
        // Return to original room
        if(variable_instance_exists(obj_battle_switcher, "original_room")) {
            room_goto(obj_battle_switcher.original_room)
        } else {
            room_goto(rm_main)  // Fallback
        }
    } else {
        room_goto(rm_main)  // Fallback if switcher doesn't exist
    }
}