image_index = option;

vspeed += 0.067;

if (vspeed >= 0)
{
	vspeed = 0
}

//Scroll
if (keyboard_check_pressed(vk_up))
{
	option -= 1
}

if (keyboard_check_pressed(vk_down))
{
	option += 1
}

if (option > 2)
{
	option = 0
}

if (option < 0)
{
	option = 2
}

//Select
if (keyboard_check_pressed(vk_enter)) || (keyboard_check_pressed(ord("Z")) || (gamepad_button_check_pressed(0, gp_face1)))
{
	switch (option)
	{
		case 0:
			room_goto(Room1)
		break;
		
		case 1:
			
		break;
		
		case 2:
			game_end()
		break;
	}
}