// Draw shared special bar at bottom of screen
var _x = camera_get_view_x(view_camera[0]) + 10
var _y = camera_get_view_y(view_camera[0]) + 10
var _w = 60
var _h = 6

draw_set_halign(fa_center)
draw_set_halign(fa_left)

draw_sprite_stretched(spr_box, 0, _x, _y, _w, _h)
draw_sprite_stretched_ext(spr_box, 1, _x, _y, _w * obj_battle_manager.party_charge, _h, c_aqua, 1)