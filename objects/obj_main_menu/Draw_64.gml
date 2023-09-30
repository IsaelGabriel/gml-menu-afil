// Center text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_font(fnt_default);

for(var i = 0; i < array_length(options); i++) {
	if(i == index) {
		draw_set_color(c_teal)
	}else {
		draw_set_color($BABABA)
	}
	draw_text(x, y + (y_offset * i), options[i]);
}