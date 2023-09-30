config_default_font();

for(var i = 0; i < array_length(options); i++) {
	var _y_pos = y + (y_offset * i);
	
	if(mouse_in_option(x, _y_pos, rect_scale, options[i]))
	{
		index = i;
		if(device_mouse_check_button_pressed(0, mb_left)) handle_option(options[i]);
	}
	
	if(i == index) {
		draw_set_color(c_teal);
		draw_text_transformed(x,_y_pos, options[i], selected_scale, selected_scale, 0);
		
		// Reset font color
		draw_set_color($BABABA);
	}else {
		draw_text(x, _y_pos, options[i]);
	}	
	
	
	
	//draw_text(x, y + (y_offset * i), options[i]);
	
}

draw_set_font(-1); // Reset font