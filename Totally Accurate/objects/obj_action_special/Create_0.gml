action = function(){
    if(obj_battle_manager.party_charge >= 1){
        var _current_turn = obj_battle_manager.turn_order[obj_battle_manager.current_turn_index]
        if(_current_turn.type != "party") exit
        
        var _current_member = obj_battle_manager.party[_current_turn.index]
        var _character = _current_member.character
        
        obj_battle_manager.party_charge = 0
        
        // Determine damage and targeting type based on character
        var _damage = 0
        var _target_type = "enemy"
        
        if(_character == "shaka") {
            _damage = _current_member.damage * 2
            _target_type = "enemy"
            
        } else if(_character == "cleopatra") {
            _damage = 0  // Healing, not damage
            _target_type = "ally"
            
        } else if(_character == "napoleon") {
            // Napoleon doesn't need targeting, execute immediately
            obj_battle_manager.targeting_mode = false
            obj_battle_manager.pending_attack_damage = 0  // No damage
            obj_battle_manager.pending_special_character = _character
            obj_battle_manager.execute_attack(0)  // Target doesn't matter
            return
        }
        
        // Start targeting mode
        obj_battle_manager.start_targeting(_damage, _character, _target_type)
    }
}