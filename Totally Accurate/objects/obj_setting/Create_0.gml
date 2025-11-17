music_on = true;

if (!music_on) {
    audio_stop_all();
}

volume = 0.3
audio_master_gain(volume)

fullscreen = display_get_gui_fullscreen();