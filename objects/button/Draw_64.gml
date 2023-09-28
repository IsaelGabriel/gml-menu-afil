/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(selected) {
	
	sprite_index = s_button_selected;
} else {
	sprite_index = s_button;
}

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _text_x = x + sprite_width / 2;
var _text_y = y + sprite_height / 2;
if(selected) _text_y += text_y_offset;

draw_text(_text_x, _text_y, text)