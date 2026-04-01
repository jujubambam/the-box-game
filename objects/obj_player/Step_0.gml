var key_left = keyboard_check(vk_left)
var key_right = keyboard_check(vk_right)
var key_jump = keyboard_check_pressed(ord("Z"))
var move = key_right - key_left

vsp += grv

// Move right
if (move == 1)
{
    hsp += acc
    if (hsp >= max_spd) hsp = max_spd
}
else if (hsp > 0) && (!place_meeting(x, y+abs(hsp)+1, obj_slope))
{
    hsp -= acc/3
}

// Move left
if (move == -1)
{
    hsp -= acc
    if (hsp <= -max_spd) hsp = -max_spd
}
else if (hsp < 0) && (!place_meeting(x, y+abs(hsp)+1, obj_slope))
{
    hsp += acc/3
}

var dir = 1;
if (move != 0) dir = move

// Jumping — check both solid and slope as ground
if (place_meeting(x, y+1, obj_solid) || place_meeting(x, y+1, obj_slope))
{
    vsp = key_jump * -jump_spd
}

if (place_meeting(x, y+1, obj_solid)) && (key_jump)
{
    audio_play_sound(snd_jump, 1, false)
}

// Horizontal collision
if (place_meeting(x+hsp, y, obj_solid))
{
    var yplus = 0
    while (place_meeting(x+hsp, y-yplus, obj_solid) && yplus <= 5)
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

// Vertical collision
if (place_meeting(x, y+vsp, obj_solid) || place_meeting(x, y+vsp, obj_slope))
{
    while (!(place_meeting(x, y+sign(vsp), obj_solid) || place_meeting(x, y+sign(vsp), obj_slope)))
    {
        y += sign(vsp)
    }
    vsp = 0
	
	max_spd = 5
	
	can_flip = false;
}

y += vsp

//go down slopes
while (place_meeting(x, y+abs(hsp)+1, obj_slope) && !place_meeting(x, y+1, obj_slope) && vsp >= 0)
{
    y += 1
	hsp += sign(hsp)*0.04
}

// reset vsp
if (place_meeting(x, y+1, obj_slope))
{
    vsp = 0
}

// Reset max speed
if (!place_meeting(x, y+abs(hsp)+1, obj_slope) && hsp > 5)
{
    max_spd = 5
}

//reset flip
if (hsp <= 5) || (hsp >= -5)
{
	alarm[0] = 5
}

if place_meeting(x+1, y, obj_crate)
{
	with obj_crate instance_destroy()
}

angle -= hsp * 2