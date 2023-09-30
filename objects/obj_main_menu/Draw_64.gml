font_reset();

for(var i = 0; i < array_length(options); i++) {
	if(i == index) {
		draw_set_color(c_teal)
	}else {
		draw_set_color($BABABA)
	}
	draw_text(x, y + (y_offset * i), options[i]);
}