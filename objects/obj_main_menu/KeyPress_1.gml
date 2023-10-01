var _key = keyboard_lastkey;

var _handle = (_key == vk_space || _key == vk_enter) && options[index] != "opt:volume";

if(_handle) {
	handle_option(options[index]);
	return;
}

switch _key {
	case vk_up:
		index--;
	break;
	
	case vk_down:
		index++;
	break;
	
	default: return;
}


if(index < 0) index = array_length(options) - 1;
else if(index >= array_length(options)) index = 0;