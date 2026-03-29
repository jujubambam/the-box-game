var key_left = keyboard_check(vk_left)
var key_right = keyboard_check(vk_right)
var key_jump = keyboard_check(ord("Z"))
var move = key_right - key_left

vsp += grv

// Move right
if (move == 1)
{
    hsp -= acc
    if (hsp <= -max_spd) hsp = -max_spd
}

// Move left
if (move == -1)
{
    hsp += acc
    if (hsp >= max_spd) hsp = max_spd
}

// Jumping — check both solid and slope as ground
if (place_meeting(x+vsp, y, obj_solid))
{
    vsp = key_jump * -jump_spd
}

// Horizontal collision
if (place_meeting(x, y+hsp, obj_solid))
{
	while (!(place_meeting(x, y+sign(hsp), obj_solid)))
    {
        y += sign(hsp)
    }
    hsp = 0
}

y += hsp

// Vertical collision
if (place_meeting(x+vsp, y, obj_solid))
{
	while (!(place_meeting(x+sign(vsp), y, obj_solid)))
    {
        x += sign(vsp)
    }
    hsp = 0
}

x += vsp

angle += hsp * 2