if(keyboard_check_pressed(vk_space)) {
    if(part_system_exists(confetti_system)) {
        part_system_destroy(confetti_system)
    }
    
    // DEBUG - Check switcher before leaving
    if(instance_exists(obj_battle_switcher)) {
        show_debug_message("WIN SCREEN: Switcher exists")
        show_debug_message("WIN SCREEN: original_room = " + room_get_name(obj_battle_switcher.original_room))
        show_debug_message("WIN SCREEN: player_x = " + string(obj_battle_switcher.player_x))
        show_debug_message("WIN SCREEN: player_y = " + string(obj_battle_switcher.player_y))
    } else {
        show_debug_message("WIN SCREEN: NO SWITCHER EXISTS!")
    }
    
    // Safe room return with validation
    if(instance_exists(obj_battle_switcher)) {
        var _target_room = obj_battle_switcher.original_room
        
        if(room_exists(_target_room)) {
            room_goto(_target_room)
        } else {
            room_goto(rm_main)
        }
    } else {
        room_goto(rm_main)
    }
}

