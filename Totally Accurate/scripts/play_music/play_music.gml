function play_music(track){
	if(current_music != track){
		if(current_music != noone) audio_stop_sound(current_music);
		audio_play_sound(track, 1, true)
		current_music = track;
	}
}