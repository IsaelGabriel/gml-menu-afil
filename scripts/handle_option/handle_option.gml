/// @function					handle_option(_option);
/// @param {string} _option		Option that was selected
function handle_option(_option){
	switch _option {
		case "Jogar":
			room_goto(rm_gameplay);
		break;
		
		case "Configurações":
			global.main_menu.index = 0;
			global.main_menu.options = global.main_menu.config_options;
		break;
		
		case "Sair":
			if show_question("Você deseja sair?") {
				game_end();
			}
			
		case "Voltar":
			global.main_menu.index = 0;
			global.main_menu.options = global.main_menu.main_options;
		break;
		
		
		default: return;
	}
}