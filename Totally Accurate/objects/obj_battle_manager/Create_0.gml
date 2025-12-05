enemy_turn = 0
damage_to_enemy = 0
party = obj_battle_switcher.party_data
enemies = obj_battle_switcher.enemy_data  // Get enemy array
party_charge = obj_battle_switcher.party_charge_data  // Load saved charge

// Targeting system
targeting_mode = false
targeting_type = "enemy"
pending_attack_damage = 0
pending_attack_type = "normal"


turn_order = []

// Add only first 3 party members with their speed
for(var i = 0; i < min(3, array_length(party)); i++) {
    array_push(turn_order, {
        type: "party", 
        index: i,
        speed: party[i].speed
    })
}

// Add all enemies with their speed
for(var i = 0; i < array_length(enemies); i++) {
    array_push(turn_order, {
        type: "enemy", 
        index: i,
        speed: enemies[i].speed_stat
    })
}

// Sort turn order by speed (highest first)
array_sort(turn_order, function(a, b) {
    return b.speed - a.speed  // Descending order (fastest first)
})

current_turn_index = 0  // Track position in turn order

// FIND FIRST ALIVE CHARACTER TO STAR
for(var i = 0; i < array_length(turn_order); i++) {
    var _turn = turn_order[i]
    var _is_alive = false
    
    if(_turn.type == "party") {
        _is_alive = (party[_turn.index].hp > 0)
    } else {
        // Check if enemy is alive
        with(obj_battle_enemy) {
            if(enemy_index == _turn.index && data.hp > 0) {
                _is_alive = true
            }
        }
    }
    
    if(_is_alive) {
        current_turn_index = i
        break
    }
}

// Set enemy_turn flag if starting with enemy
if(turn_order[current_turn_index].type == "enemy") {
    enemy_turn = 1
    alarm[1] = 80  // Start enemy turn
}

player_attack = function (_damage, _target_enemy_index)
{
    damage_to_enemy = _damage
    target_enemy = _target_enemy_index
    enemy_turn = 1
    alarm[0] = 40
    
    // Animate current party member
    var _current_turn = turn_order[current_turn_index]
    if(_current_turn.type == "party") {
        with(obj_battle_player) {
            if(party_index == _current_turn.index) {
                alarm[0] = 10
            }
        }
    }
}

check_for_end = function(){
    // Check if all party members are dead
    var _all_party_dead = true
    for(var i = 0; i < array_length(party); i++) {
        if(party[i].hp > 0) {
            _all_party_dead = false
            break
        }
    }
    
    // Check if all enemies are dead
    var _all_enemies_dead = true
    with(obj_battle_enemy) {
        if(data.hp > 0) {
            _all_enemies_dead = false
        }
    }
    
    return (_all_party_dead || _all_enemies_dead)
}

next_turn = function(){
    // Move to next turn in order
    current_turn_index++
    if(current_turn_index >= array_length(turn_order)) {
        current_turn_index = 0  // Loop back to start
    }
    
    // Skip dead characters/enemies
    var _turn = turn_order[current_turn_index]
    var _is_dead = false
    
    if(_turn.type == "party") {
        _is_dead = (party[_turn.index].hp <= 0)
    } else {
        // Check if this enemy is dead
        with(obj_battle_enemy) {
            if(enemy_index == _turn.index && data.hp <= 0) {
                _is_dead = true
            }
        }
    }
    
    if(_is_dead) {
        next_turn()  // Skip to next
        return
    }
    
    // Check if it's enemy turn
    if(_turn.type == "enemy") {
        enemy_turn = 1
        alarm[1] = 80  // Enemy attacks after delay
    } else {
        enemy_turn = 0
    }
}

// Create 3 party member instances (only first 3)
for(var i = 0; i < min(3, array_length(party)); i++) {
    var _player = instance_create_depth(60 + (i * 100), 445, 0, obj_battle_player)  // Changed position 
    _player.party_index = i
    _player.data = party[i]
    _player.sprite_index = party[i].sprite
    _player.current_sprite = party[i].sprite
}

// Create enemy instances
for(var i = 0; i < array_length(enemies); i++) {
    var _enemy = instance_create_depth(700 + (i * 100), 370, 0, obj_battle_enemy)  // Changed position 
    _enemy.enemy_index = i
    _enemy.data = enemies[i]
    _enemy.sprite_index = enemies[i].sprite_index
    _enemy.current_sprite = enemies[i].sprite_index
}

start_targeting = function(_damage, _character_or_type, _target_type) {
    targeting_mode = true
    targeting_type = _target_type  // "enemy" or "ally"
    pending_attack_damage = _damage
    pending_special_character = _character_or_type  // Can be character name or "normal"
}

execute_attack = function(_target_index) {
    targeting_mode = false
    
    var _character = pending_special_character
    var _current_turn = turn_order[current_turn_index]
    
    // Execute different attacks based on type
    if(_character == "normal") {
        // Normal light attack
        player_attack(pending_attack_damage, _target_index)
        
    } else if(_character == "shaka") {
        // Shaka: Extra damage to one enemy
        player_attack(pending_attack_damage, _target_index)
        
    } else if(_character == "cleopatra") {
        // Cleopatra: Heal one ally
        party[_target_index].hp += 50  // Heal amount
        if(party[_target_index].hp > party[_target_index].hp_total) {
            party[_target_index].hp = party[_target_index].hp_total
        }
        
        // Animate Cleopatra
        with(obj_battle_player) {
            if(party_index == _current_turn.index) {
                alarm[0] = 10  // Trigger animation
            }
        }
        
        // Spawn healing particles on target
        var _target_player = noone
        with(obj_battle_player) {
            if(party_index == _target_index) {
                _target_player = id
            }
        }
        
        if(_target_player != noone) {
            // Burst of healing sparkles
            part_particles_create(healing_particle_system, _target_player.x + _target_player.sprite_width/2, _target_player.y + _target_player.sprite_height/2, healing_particle, 20)
        }
        
        // Move to next turn after healing
        enemy_turn = 1
        alarm[0] = 40
        
    } else if(_character == "napoleon") {
        // Napoleon: Grant protection to only himself (attacks will miss)
        party[_current_turn.index].napoleon_protected = true
        
        // Animate Napoleon
        with(obj_battle_player) {
            if(party_index == _current_turn.index) {
                alarm[0] = 10  // Trigger animation
            }
        }
        
        // Move to next turn
        enemy_turn = 1
        alarm[0] = 40
    }
}

// Create particle system for healing effect
healing_particle_system = part_system_create()
part_system_depth(healing_particle_system, -1000)

// Create healing particle type
healing_particle = part_type_create()
part_type_shape(healing_particle, pt_shape_star)
part_type_size(healing_particle, 0.3, 0.6, -0.01, 0)  
part_type_color1(healing_particle, c_lime)
part_type_alpha3(healing_particle, 1, 0.8, 0)
part_type_speed(healing_particle, 0.5, 1.5, -0.05, 0)
part_type_direction(healing_particle, 0, 360, 0, 0)
part_type_life(healing_particle, 30, 60)
