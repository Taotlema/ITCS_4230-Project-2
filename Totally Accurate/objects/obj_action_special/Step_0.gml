var _current_turn = obj_battle_manager.turn_order[obj_battle_manager.current_turn_index]
var _is_party_turn = (_current_turn.type == "party")
var _has_charge = (obj_battle_manager.party_charge >= 1)

// Dim if not party turn, no charge, OR if in targeting mode
if(!_is_party_turn || !_has_charge || obj_battle_manager.targeting_mode){
    image_alpha = 0.2
}else{
    image_alpha = 1
}