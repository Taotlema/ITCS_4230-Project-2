// Restore player position after battle
if(instance_exists(obj_battle_switcher)) {
    show_debug_message("ROOM START: Switcher exists!")
    
    if(variable_instance_exists(obj_battle_switcher, "player_x")) {
        show_debug_message("ROOM START: Restoring to " + string(obj_battle_switcher.player_x) + ", " + string(obj_battle_switcher.player_y))
        
        x = obj_battle_switcher.player_x
        y = obj_battle_switcher.player_y
        
        // Center camera on restored position
        if(view_enabled) {
            camera_set_view_pos(view_camera[0], x - 320, y - 180)
        }
    }
    
    // CRITICAL: Destroy switcher so we can start new battles
    instance_destroy(obj_battle_switcher)
    show_debug_message("ROOM START: Switcher destroyed")
}