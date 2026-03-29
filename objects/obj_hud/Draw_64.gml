var x1, y1, x2, y2, outline_width;
x1 = 25;
y1 = 25;
x2 = 75;
y2 = 75;
outline_width = 5; // Set your desired thickness here

draw_set_color(c_black); // Set the color of the outline

// Draw the four lines
draw_line_width(x1, y1, x2, y1, outline_width); // Top line
draw_line_width(x1, y2, x2, y2, outline_width); // Bottom line
draw_line_width(x1, y1, x1, y2, outline_width); // Left line
draw_line_width(x2, y1, x2, y2, outline_width); // Right line

draw_set_font(Font2)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text(x2+12, y2, "X")

draw_set_color(c_white)
//draw_sprite(spr, 0, 50, 50)