#macro VOLUME_BAR_WIDTH (window_get_width() / 3)
#macro VOLUME_BAR_HEIGHT 1
#macro SELECTION_SCALE 1.25


/// @function					draw_option(_x, _y, _option, _selected);
/// @description				Draws an option on screen, returns it's height
/// @param {real} _x			Option's x position
/// @param {real} _y			Option's y position
/// @param {string}	_option		Option's text
/// @param {bool} _selected		Checks if option is selected
/// @param {resource} _font		Font used for text

function draw_option(_x, _y, _option = "opt:default", _selected = false, _font = fnt_default){
	switch _option {
		case "opt:volume": return draw_volume(_x, _y, _selected, _font);
		default:
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
		return _height;
	}
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
	var _height = font_get_size(_font);
	draw_text(_x, _y, "Volume");
	_y += _height * 2;
	
	draw_set_color(c_lime);
	draw_line(_x - (VOLUME_BAR_WIDTH / 2), _y, _x + (VOLUME_BAR_WIDTH / 2), _y);
	_height += VOLUME_BAR_HEIGHT;
	
	draw_set_color(global.default_gui_text_color);
	
	return _height;	
}