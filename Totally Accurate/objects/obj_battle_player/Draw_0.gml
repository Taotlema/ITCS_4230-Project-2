draw_self()

var _x = xstart - 20
var _y = ystart + 20
var _w = 40
var _h = 8

draw_sprite_stretched(spr_7, 0, _x, _y, _w, _h)
draw_sprite_stretched_ext(spr_7, 1, _x, _y ,_w * (data.hp/ data.hp_total), _h, c_green, 1)
draw_text(_x + _w/2, _y, string(data.hp) + " / " + string(data.hp_total))

_y += _h
_h = 4
draw_sprite_stretched(spr_7, 0, _x, _y, _w, _h)
draw_sprite_stretched_ext(spr_7, 1, _x, _y ,_w * data.charge, _h, c_green, 1)