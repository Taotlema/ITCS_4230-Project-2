//play music
audio_play_sound(sfx_win, 1, false)

// Create confetti particle system
confetti_system = part_system_create()
part_system_depth(confetti_system, -1000)

// Create confetti particle type
confetti_particle = part_type_create()
part_type_shape(confetti_particle, pt_shape_square)
part_type_size(confetti_particle, 0.05, 0.15, 0, 0)
part_type_color3(confetti_particle, c_red, c_yellow, c_aqua)
part_type_alpha3(confetti_particle, 1, 1, 0)
part_type_speed(confetti_particle, 2, 4, -0.1, 0)
part_type_direction(confetti_particle, 60, 120, 0, 5)  // Upward
part_type_gravity(confetti_particle, 0.2, 270)  // Falls down
part_type_life(confetti_particle, 60, 120)

alarm[0] = 180