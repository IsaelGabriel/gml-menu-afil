#macro VOLUME_BAR_WIDTH (window_get_width() / 3)
#macro VOLUME_HANDLE_R 10
#macro VOLUME_KEY_STEP 0.01
#macro SELECTION_SCALE 1.25

/// @function					draw_option(_x, _y, _option, _selected);
/// @description				Draws an option on screen, returns it's height
/// @param {real} _x			Option's x position
/// @param {real} _y			Option's y position
/// @param {string}	_option		Option's text
/// @param {bool} _selected		Checks if option is selected
/// @param {resource} _font		Font used for text

function draw_option(_x, _y, _option = "opt:default", _selected = false, _font = fnt_default){

	var _text = get_option_text(_option);
	if(_selected) {
	draw_set_color(c_teal);
	draw_text_transformed(_x,_y, _text, SELECTION_SCALE, SELECTION_SCALE, 0);
	
	// Reset font color
	draw_set_color(global.default_gui_text_color);
	}else {
		draw_text(_x, _y, _text);
	}
	var _height = font_get_size(_font);
	
	switch _option {
		case "opt:volume":
			_height += draw_volume(_x, _y + _height * 2, _selected, _font);
		break;
	}
	
	return _height;
}

/// @function					get_option_text(_option);
/// @description				Sets text for text only options
/// @param {string} _option		Option Key
function get_option_text(_option) {
	switch _option {
		case "opt:play": return "Jogar";
		case "opt:config": return "Configurações";
		case "opt:exit": return "Sair";
		case "opt:volume": return "Volume";
		case "opt:fullscreen":
			var _text = "Tela Cheia: ";
			if(window_get_fullscreen()) _text += "Sim";
			else _text += "Não";
		return _text;
		case "opt:config_back": return "Voltar";
		
		default: return "None";
	}
}

/// @function draw_volume(_x, _y, _selected, _font);
/// @description Draws volume option on screen, returns size
/// @param {real} _x			Option's x position
/// @param {real} _y			Option's y position
/// @param {bool} _selected		Checks if volume option is selected
/// @param {resource} _font		Font used for text
function draw_volume(_x, _y, _selected = false, _font = fnt_default) {
	var _height = VOLUME_HANDLE_R;
	_y += _height;
	
	// Draw bar
	draw_set_color(c_lime);
	draw_line_width(_x - (VOLUME_BAR_WIDTH / 2), _y, _x + (VOLUME_BAR_WIDTH / 2), _y, 5);
	
	// Draw handle
	// v -> 0% min - 100% max
	var _volume = audio_get_master_gain(0) * VOLUME_BAR_WIDTH;
	var _handle_x1 = _x - (VOLUME_BAR_WIDTH / 2);
	var _handle_x2 = _x + (VOLUME_BAR_WIDTH / 2);
	var _handle_x = clamp(_x - VOLUME_BAR_WIDTH / 2 + _volume, _handle_x1, _handle_x2);
	draw_set_color(c_yellow);
	draw_circle(_handle_x, _y, VOLUME_HANDLE_R, false);
	
	if(_selected) {
		draw_set_color(c_gray);
		for(var i = 0; i <= 2; i++) {
			draw_circle(_handle_x, _y, VOLUME_HANDLE_R - i, true);	
		}
		//draw_circle(_x, _y, VOLUME_HANDLE_R, true);
	}
	
	_height += VOLUME_HANDLE_R * 2;
	
	draw_set_color(global.default_gui_text_color);
	
	return _height;	
}

/// @function mouse_in_option(_x, _y, _scale, _option);
/// @param {real} _x			The option's center x value
/// @param {real} _y			The option's center y value
/// @param {real} _rect_scale	The option's rect scale
/// @param {string} _option		Option text
/// @param {resource} _font		Text font for buttons
function mouse_in_option(_x, _y, _rect_scale, _option, _font = fnt_default){
	var _mouse_x = device_mouse_x_to_gui(0);
	var _mouse_y = device_mouse_y_to_gui(0);
	
	var _rect_h, _rect_w, _x1, _x2, _y1, _y2;

	switch(_option) {
		case "opt:volume":
			_y += 2 * font_get_size(_font) + VOLUME_HANDLE_R;
			_rect_h = VOLUME_HANDLE_R * 2 + 10;
			_rect_w = VOLUME_BAR_WIDTH;
		break;
		
		default:
			_rect_h = font_get_size(_font);
			_rect_w = string_width(get_option_text(_option));
		break;
		
	}
	
	_x1 = _x - (_rect_w / 2) * _rect_scale;
	_x2 = _x + (_rect_w / 2) * _rect_scale;
	
	_y1 = _y - (_rect_h / 2) * _rect_scale;
	_y2 = _y + (_rect_h / 2) * _rect_scale;
	
	return point_in_rectangle(_mouse_x, _mouse_y, _x1, _y1, _x2, _y2);
	
}

/// @function					handle_option(_option);
/// @param {string} _option		Option that was selected
/// @param {bool} _using_mouse	Checks whether option was clicked or pressed
function handle_option(_option, _using_mouse = false){
	switch _option {
		case "opt:play":
			room_goto(rm_gameplay);
		break;
		
		case "opt:config":
			global.main_menu.index = 0;
			global.main_menu.options = global.main_menu.config_options;
		break;
		
		case "opt:exit":
			if show_question("Você deseja sair?") {
				game_end();
			}
			
		case "opt:config_back":
			global.main_menu.index = 0;
			global.main_menu.options = global.main_menu.main_options;
		break;
		
		case "opt:fullscreen":
			var _fullscreen = !window_get_fullscreen();
			
			window_set_fullscreen(_fullscreen);
			if(!_fullscreen) {
				window_center();
				window_set_size(global.window_width, global.window_height);
			}
			
		break;
		
		case "opt:volume":
			if(_using_mouse) {
				var _volume_x1 = (window_get_width() - VOLUME_BAR_WIDTH) / 2;
				var _volume_x2 = (window_get_width() + VOLUME_BAR_WIDTH) / 2;
				
				if(window_get_fullscreen()) { // Fix bar position
					_volume_x1 -= (window_get_width() - global.window_width) / 2;
					_volume_x2 -= (window_get_width() - global.window_width) / 2;
				}
				
				
				var _mouse_x = clamp(device_mouse_x_to_gui(0), _volume_x1, _volume_x2);
				audio_set_master_gain(0,  (_mouse_x - _volume_x1) / VOLUME_BAR_WIDTH);
			}else {
				var _gain = audio_get_master_gain(0);
				if keyboard_check(vk_left) {
					_gain -= VOLUME_KEY_STEP;
				}
				if keyboard_check(vk_right) {
					_gain += VOLUME_KEY_STEP;	
				}
				audio_set_master_gain(0, clamp(_gain, 0, 1));
			}
		break;
		
		default: return;
	}
}