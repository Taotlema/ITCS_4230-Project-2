// Draw shared special bar at top left of screen 
var _x = camera_get_view_x(view_camera[0]) + 15
var _y = camera_get_view_y(view_camera[0]) + 15
var _w = 120  
var _h = 12   

draw_sprite_stretched(spr_box, 0, _x, _y, _w, _h)
draw_sprite_stretched_ext(spr_box, 1, _x, _y, _w * obj_battle_manager.party_charge, _h, c_aqua, 1)