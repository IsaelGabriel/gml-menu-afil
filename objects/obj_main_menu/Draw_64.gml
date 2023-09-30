config_default_font();

for(var i = 0; i < array_length(options); i++) {
	var y_pos = y + (y_offset * i);
	if(i == index) {
		draw_set_color(c_teal);
		draw_text_transformed(x, y_pos, options[i], selected_scale, selected_scale, 0);
		
		// Reset font color
		draw_set_color($BABABA);
	}else {
		draw_text(x, y_pos, options[i]);
	}
	//draw_text(x, y + (y_offset * i), options[i]);
	
}

draw_set_font(-1); // Reset font