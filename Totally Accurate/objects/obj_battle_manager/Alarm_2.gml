// Check if player won or lost
var _all_dead = true
for(var i = 0; i < array_length(party); i++) {
    if(party[i].hp > 0) {
        _all_dead = false
        break
    }
}

if(_all_dead) {
    room_goto(rm_lose) 
} else {
    room_goto(rm_win)
}