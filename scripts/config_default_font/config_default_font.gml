/// @function config_default_font();

function config_default_font(){
	// Center text
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

	// Set font to default
	draw_set_font(fnt_default);
	
	// Set font color
	draw_set_color($BABABA);
}