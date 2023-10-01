selected_scale = 1.4

/// @function					draw_option(_x, _y, _option, _selected);
/// @param {real} _x			Option's x position
/// @param {real} _y			Option's y position
/// @param {string}	_option		Option's text
/// @param {bool} _selected		(optional)

function draw_option(_x, _y, _option = "Option", _selected = false){
	switch _option {
		default:
			if(_selected) {
			draw_set_color(c_teal);
			draw_text_transformed(_x,_y, _option, selected_scale, selected_scale, 0);
		
			// Reset font color
			draw_set_color($BABABA);
			}else {
				draw_text(_x, _y, _option);
			}
		break;
	}
}