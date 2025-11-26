sprite_offset -= 2  // Move left (negative for enemy)
if(sprite_offset < -20){  // Stop after moving 20 pixels left
	alarm[1] = 1
}else{
	alarm[0] = 1
}