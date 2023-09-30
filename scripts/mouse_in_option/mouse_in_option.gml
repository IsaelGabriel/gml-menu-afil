/// @function mouse_in_option(_x, _y, _scale, _option);
/// @param {real} _x			The option's center x value
/// @param {real} _y			The option's center y value
/// @param {real} _rect_scale	The option's rect scale
/// @param {string} _option		Option text
function mouse_in_option(_x, _y, _rect_scale, _option){
	var _mouse_x = device_mouse_x_to_gui(0);
	var _mouse_y = device_mouse_y_to_gui(0);
	
	var _str_h = string_height(_option);
	var _str_w = string_width(_option);
	
	var _x1 = _x - (_str_w / 2) * _rect_scale;
	var _x2 = _x + (_str_w / 2) * _rect_scale;
	
	var _y1 = _y - (_str_h / 2) * _rect_scale;
	var _y2 = _y + (_str_h / 2) * _rect_scale;
	
	return point_in_rectangle(_mouse_x, _mouse_y, _x1, _y1, _x2, _y2);
	
}