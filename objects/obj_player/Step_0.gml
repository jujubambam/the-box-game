key_left = keyboard_check(vk_left)
key_right = keyboard_check(vk_right)
key_jump = keyboard_check(ord("Z"))
key_gun = keyboard_check(ord("X"))

var move = key_right-key_left
vsp += grv

//move right
if (move = 1)
{
	hsp += acc
	if (hsp >= max_spd) hsp = max_spd
}
else if (hsp > 0)
{
	hsp -= acc/3
}

//move left
if (move = -1)
{
	hsp -= acc
	if (hsp <= -max_spd) hsp = -max_spd
}
else if (hsp < 0)
{
	hsp += acc/3
}

//jumping
if (place_meeting(x, y+1, obj_solid))
{
	vsp = key_jump * -jump_spd
}

//horizontal collision
if (place_meeting(x+hsp, y, obj_solid))
{
	var yplus = 0;
	while (place_meeting(x+hsp, y-yplus, obj_solid) && yplus <= abs(1*hsp))
	{
		yplus += 1
	}
	
	if (place_meeting(x+hsp, y-yplus, obj_solid))
	{
		while (!place_meeting(x+sign(hsp), y, obj_solid))
		{
			x += sign(hsp)
		}
		hsp = 0
	}
	else
	{
		y -= yplus
	}
	
}

x += hsp

//vertical collision
if (place_meeting(x, y+vsp, obj_solid))
{
	while (place_meeting(x, y+sign(vsp), obj_solid))
	{
		y += sign(vsp)
	}
	vsp = 0
}

//g o  d o w n  s l o p e s
while (place_meeting(x, y+hsp+1, obj_slope) && (!place_meeting(x, y+1, obj_slope)) && vspeed >=0)
{
	y += 1
}

y += vsp

angle -= hsp