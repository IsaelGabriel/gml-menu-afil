config_default_font();

for(var i = 0; i < array_length(options); i++) {
	var _y_pos = y + (y_offset * i);
	
	if(mouse_in_option(x, _y_pos, rect_scale, options[i]))
	{
		index = i;
		if(device_mouse_check_button_pressed(0, mb_left)) handle_option(options[i]);
	}
	
	draw_option(x, _y_pos, options[i], i == index);
}

draw_set_font(-1); // Reset font