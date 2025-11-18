// Check who won and go to the appropriate room
if(obj_battle_player.data.hp <= 0){
    // Player lost
    room_goto(rm_lose)
} else if(obj_battle_enemy.data.hp <= 0){
    // Player won
    room_goto(rm_win)
} else {
    // Fallback - shouldn't happen but just in case
    room_goto(obj_battle_switcher.original_room)
}