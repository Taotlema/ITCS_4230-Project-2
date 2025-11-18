if (!audio_is_playing(overworld)) {
	audio_stop_sound(battle);
}
if (!audio_is_playing(battle)) {
	audio_play_sound(overworld, 10, true);
}