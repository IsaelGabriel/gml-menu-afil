global.main_menu = self;
global.window_width = 800;
global.window_height = 600;


main_options = ["opt:play", "opt:config", "opt:exit"];
config_options = ["opt:volume", "opt:fullscreen", "opt:config_back"];

options = main_options;

index = 0;

y_offset = font_get_size(fnt_default) * 4;
selected_scale = 1.25;
rect_scale = 1.4;

x = display_get_gui_width() / 2 // Center x
y = (display_get_gui_height() / 2) - (((array_length(options) - 1) * y_offset) / 2) // Center y