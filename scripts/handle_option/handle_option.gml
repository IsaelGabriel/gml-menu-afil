/// @function					handle_option(_option);
/// @param {string} _option		Option that was selected
function handle_option(_option){
	show_message(_option);
	switch _option {
		case "Jogar":
		
		break;
		
		case "Configurações":
		
		break;
		
		case "Sair":
			if show_question("Você deseja sair?") {
				game_end();
			}
		break;
		
		
		default:
			break;
	}


}