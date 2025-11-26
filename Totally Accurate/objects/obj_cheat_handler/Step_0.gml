// Capture keyboard input for cheat codes
if(keyboard_check_pressed(vk_anykey)) {
    var _key = keyboard_lastchar
    
    // Only add letter keys
    if(string_length(_key) == 1) {
        cheat_input += string_upper(_key)
        cheat_timer = 120  // 2 seconds to finish typing
    }
}

// Clear input after timeout
if(cheat_timer > 0) {
    cheat_timer--
} else {
    cheat_input = ""
}

	//Check for cheat codes
	if(string_length(cheat_input) >= 4) {
    
	 //	FULLHEAL - Heal all party members
	if(string_pos("FULLHEAL", cheat_input) > 0) {
    //	Heal party data in obj_player
	if(instance_exists(obj_player)) {
		with(obj_player) {
			for(var i = 0; i < array_length(party); i++) {
                party[i].hp = party[i].hp_total
                party[i].displayed_hp = party[i].hp_total
            }
        }
    }
    
    // Also heal in battle if currently in battle
    if(instance_exists(obj_battle_manager)) {
        with(obj_battle_manager) {
            for(var i = 0; i < array_length(party); i++) {
                party[i].hp = party[i].hp_total
                party[i].displayed_hp = party[i].hp_total
            }
        }
    }
    
    show_debug_message("CHEAT: Full Heal Activated!")
    cheat_input = ""
}
    
    // MAXPOWER - Fill special bar
    if(string_pos("MAXPOWER", cheat_input) > 0) {
        if(instance_exists(obj_player)) {
            obj_player.party_charge = 1
        }
        if(instance_exists(obj_battle_manager)) {
            obj_battle_manager.party_charge = 1
        }
        show_debug_message("CHEAT: Max Power Activated!")
        cheat_input = ""
    }
    
    // INSTA - Instantly defeat all enemies (battle only)
    if(string_pos("INSTA", cheat_input) > 0) {
        if(instance_exists(obj_battle_enemy)) {
            with(obj_battle_enemy) {
                data.hp = 0
                displayed_hp = 0
            }
            if(instance_exists(obj_battle_manager)) {
                obj_battle_manager.alarm[2] = 30  // Trigger battle end
            }
        }
        show_debug_message("CHEAT: Insta-Kill Activated!")
        cheat_input = ""
    }
}

// Clear if input gets too long
if(string_length(cheat_input) > 20) {
    cheat_input = ""
}