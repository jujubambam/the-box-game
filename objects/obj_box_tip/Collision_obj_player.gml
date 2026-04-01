if (other.can_flip = true)
{
	angle_plus = 3;
	with other instance_change(obj_player_flipped, false)
	layer_set_visible("shake", true)
	camera_set_view_target(view_camera[0], obj_player_flipped)
	alarm[0] = 10
	audio_play_sound(snd_bump, 1, false)
}