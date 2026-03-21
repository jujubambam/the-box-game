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
draw_text