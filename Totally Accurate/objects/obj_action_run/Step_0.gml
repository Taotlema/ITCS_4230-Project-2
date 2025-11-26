var _current_turn = obj_battle_manager.turn_order[obj_battle_manager.current_turn_index]
var _is_party_turn = (_current_turn.type == "party")

if(!_is_party_turn){
    image_alpha = 0.2
}else{
    image_alpha = 1
}