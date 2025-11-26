var _current_turn = obj_battle_manager.turn_order[obj_battle_manager.current_turn_index]
var _is_party_turn = (_current_turn.type == "party")

// Dim if not party turn OR if in targeting mode
if(!_is_party_turn || obj_battle_manager.targeting_mode){
    image_alpha = 0.2
}else{
    image_alpha = 1
}