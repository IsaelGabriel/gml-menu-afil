/// @function					handle_option(_option);
/// @param {string} _option		Option that was selected
function handle_option(_option){
	switch _option {
		case "Jogar":
			room_goto(rm_gameplay);
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