// Find the target enemy and damage it (only if targeting an enemy)
if(variable_instance_exists(id, "target_enemy")) {
    with(obj_battle_enemy) {
        if(enemy_index == other.target_enemy) {
            data.hp -= other.damage_to_enemy
        }
    }
}

if(check_for_end()){
    alarm[2] = 60
} else {
    next_turn()
}

// Add to shared party charge bar
party_charge += 0.15
if(party_charge > 1){
    party_charge = 1
}