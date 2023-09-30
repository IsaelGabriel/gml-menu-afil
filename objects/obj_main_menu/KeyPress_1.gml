var _key = keyboard_lastkey;
if(_key == vk_up) {
	index--;
}
if(_key == vk_down) {
	index++;	
}

if(index < 0) index = array_length(options) - 1;
else if(index >= array_length(options)) index = 0;