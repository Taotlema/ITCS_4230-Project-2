if (!audio_is_playing(battle)) {
	audio_stop_sound(overworld);
}
if (!audio_is_playing(overworld)) {
	audio_play_sound(battle, 10, true);
}