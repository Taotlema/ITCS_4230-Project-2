if(keyboard_check_pressed(vk_space)) {
    if(part_system_exists(confetti_system)) {
        part_system_destroy(confetti_system)
    }
    
    // Simple room return - just go to original room (will reset everything)
    if(instance_exists(obj_battle_switcher)) {
        room_goto(obj_battle_switcher.original_room)
    } else {
        room_goto(rm_main)
    }
}

// Spawn confetti continuously from top
if(part_system_exists(confetti_system) && random(1) < 0.3) {
    var _x = random_range(0, room_width)
    part_particles_create(confetti_system, _x, -10, confetti_particle, 2)
}

