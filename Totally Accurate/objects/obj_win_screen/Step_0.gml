if(keyboard_check_pressed(vk_space)) {
    if(part_system_exists(confetti_system)) {
        part_system_destroy(confetti_system)
    }
    // Returns to whatever room the battle was triggered from
    room_goto(obj_battle_switcher.original_room)
}

// Spawn confetti continuously from top (only if system exists)
if(part_system_exists(confetti_system) && random(1) < 0.3) {  // 30% chance each frame
    var _x = random_range(0, room_width)
    part_particles_create(confetti_system, _x, -10, confetti_particle, 2)
}