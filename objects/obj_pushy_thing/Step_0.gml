if (!fired)
{
    if (instance_exists(player))
    {
        x = player.x + hsp;
        y = player.y;
    }

    if (keyboard_check_pressed(ord("X")))
    {
        fired = true;

        if (player.hsp < 0) image_xscale = -1;
        else if (player.hsp > 0) image_xscale = 1;

        hsp = 15 * image_xscale;
        alarm[0] = 15;
    }
}
else
{
    x += hsp;
}