y = ystart + 4 

audio_play_sound(sfx_click, 1, false)

alarm[0] = 10


switch (button_type) {
    case "fullscreen":
        window_set_fullscreen(!window_get_fullscreen());
    break;

    case "volume_up":
        global.volume = clamp(global.volume + 0.1, 0, 1);
        audio_master_gain(global.volume);
    break;

    case "volume_down":
        global.volume = clamp(global.volume - 0.1, 0, 1);
        audio_master_gain(global.volume);
    break;

    case "mute":
        global.volume = (global.volume > 0) ? 0 : 1;
        audio_master_gain(global.volume);
    break;
}