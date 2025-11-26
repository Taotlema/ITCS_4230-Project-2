if(part_system_exists(confetti_system)) {
    part_system_destroy(confetti_system)  // Clean up before leaving
}
room_goto(rm_main)