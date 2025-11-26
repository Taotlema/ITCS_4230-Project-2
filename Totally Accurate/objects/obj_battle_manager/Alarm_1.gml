// Get current enemy that's attacking
var _current_turn = turn_order[current_turn_index]
var _attacking_enemy = noone

with(obj_battle_enemy) {
    if(enemy_index == _current_turn.index) {
        _attacking_enemy = id
        alarm[0] = 10  // Trigger enemy attack animation
    }
}


alarm[3] = 30  // Delay before dealing damage and ending turn