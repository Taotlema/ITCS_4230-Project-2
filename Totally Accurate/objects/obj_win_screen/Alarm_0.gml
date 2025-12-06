if(part_system_exists(confetti_system)) {
    part_system_destroy(confetti_system)
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