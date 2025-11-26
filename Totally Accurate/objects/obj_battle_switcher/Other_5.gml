// Save party_charge back to player when leaving battle
if(room == rm_battle && instance_exists(obj_battle_manager)) {
    party_charge_data = obj_battle_manager.party_charge
}