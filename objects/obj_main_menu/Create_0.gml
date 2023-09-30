options = ["Jogar", "Configurações", "Sair"];

index = 0;

y_offset = font_get_size(fnt_default) * 4;
selected_scale = 1.25;

x = display_get_gui_width() / 2 // Center x
y = (display_get_gui_height() / 2) - (((array_length(options) - 1) * y_offset) / 2) // Center y