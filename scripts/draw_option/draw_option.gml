selected_scale = 1.4;

/// @function					draw_option(_x, _y, _option, _selected);
/// @description				Draws an option on screen, returns it's height
/// @param {real} _x			Option's x position
/// @param {real} _y			Option's y position
/// @param {string}	_option		Option's text
/// @param {bool} _selected		Checks if option is selected
/// @param {resource} _font		Font used for text

function draw_option(_x, _y, _option = "opt:default", _selected = false, _font = fnt_default){
	switch _option {
		default:
			var _text = get_option_text(_option);
			if(_selected) {
			draw_set_color(c_teal);
			draw_text_transformed(_x,_y, _text, selected_scale, selected_scale, 0);
		
			// Reset font color
			draw_set_color($BABABA);
			}else {
				draw_text(_x, _y, _text);
			}
		var _height = font_get_size(_font);
		return _height;
	}
}

/// @function get_option_text(_option);
/// @description sets text for text only options
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