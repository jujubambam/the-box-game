if (collide)
{
	draw_set_alpha(alpha_bg)
	diy_timer[0] += 1
	
	if (diy_timer[0] >= 60)
	{
		//diy_timer[0] = 0;
		alpha_bg += 0.01;
		diy_timer[1] += 1;
		alpha_bg = clamp(alpha_bg, 0, 1)
	}
	draw_rectangle_color(0, 0, 854, 480, c_black, c_black, c_black, c_black, false)
	
	draw_set_alpha(1)
	draw_set_font(Font1)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	
	alpha_text += 0.01;
    alpha_text = clamp(alpha_text, 0, 1);
	draw_text_color(854/2, 480/2, "GAME OVER", c_white, c_white, c_white, c_white, alpha_text)
	
	if (diy_timer[1] >= 150)
	{
		alpha_text -= 0.01
		alpha_text = max(0, alpha_text - 0.01);
		
		if (alpha_text <= 0.01)
		{
			room_restart();
		}
	}
}