action = function ()
{
    // Find current party member
    var _current_turn = obj_battle_manager.turn_order[obj_battle_manager.current_turn_index]
    if(_current_turn.type != "party") exit
    
    var _current_member = obj_battle_manager.party[_current_turn.index]
    
    // Start targeting mode with character info
    obj_battle_manager.start_targeting(_current_member.damage, "normal", "enemy")
}