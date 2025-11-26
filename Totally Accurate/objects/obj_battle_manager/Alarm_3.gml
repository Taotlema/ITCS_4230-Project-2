// Deal damage after enemy animation completes
var _current_turn = turn_order[current_turn_index]
var _attacking_enemy = noone

with(obj_battle_enemy) {
    if(enemy_index == _current_turn.index) {
        _attacking_enemy = id
    }
}

if(_attacking_enemy != noone) {
    var _enemy_damage = _attacking_enemy.data.damage * random_range(1, 2)
    
    // Enemy attacks a random alive party member
    var _alive_members = []
    for(var i = 0; i < array_length(party); i++) {
        if(party[i].hp > 0) {
            array_push(_alive_members, i)
        }
    }
    
    if(array_length(_alive_members) > 0) {
        var _target = _alive_members[irandom(array_length(_alive_members) - 1)]
        
        // Check if target is protected by Napoleon
        if(party[_target].napoleon_protected) {
            // Attack misses!
            party[_target].napoleon_protected = false  // Remove protection after use
            
            // Show "MISSED!" text
            var _target_player = noone
            with(obj_battle_player) {
                if(party_index == _target) {
                    _target_player = id
                }
            }
            
            if(_target_player != noone) {
                var _miss_text = instance_create_depth(_target_player.x, _target_player.y - 20, -100, obj_damage_text)
                _miss_text.text = "MISSED!"
                _miss_text.color = c_yellow
            }
			} else {
			// Normal damage
			party[_target].hp -= _enemy_damage
    
		    //Trigger white flash on damaged character
			with(obj_battle_player) {
			if(party_index == _target) {
            flash_alpha = 1  // Start flash at full intensity
				}
			}
		}
    }
}

// Another delay before ending turn and lighting up buttons
alarm[4] = 30