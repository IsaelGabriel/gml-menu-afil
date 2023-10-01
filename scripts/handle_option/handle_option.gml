/// @function					handle_option(_option);
/// @param {string} _option		Option that was selected
function handle_option(_option){
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
		
		default: return;
	}
}