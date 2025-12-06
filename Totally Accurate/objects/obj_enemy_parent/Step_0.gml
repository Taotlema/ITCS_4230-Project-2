if(instance_exists(obj_dialogue)) exit

var _hor = clamp(target_x - x, -1, 1);
var _ver = clamp(target_y - y, -1, 1);

if (hp <= 0)
{
	instance_destroy()
}