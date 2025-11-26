// End enemy turn and move to next turn
enemy_turn = 0

if(check_for_end()){
    alarm[2] = 60
} else {
    next_turn()
}