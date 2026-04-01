x = obj_player.x
y = obj_player.y + 5
image_xscale = obj_player.dir


if (!instance_exists(obj_player))
{
	instance_destroy()
}