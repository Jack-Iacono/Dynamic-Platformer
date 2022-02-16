/// @description Initializers

global.pause = false;
global.pause_player = false;
global.pause_world = false;
global.control = true;
global.pause_timer = max_time;
global.debug_menu = true;
global.time_regen_allowed = true;
global.pause_mode = 1;

pause_sprite_draw = spr_icon_player;

pause_timer_edge_buffer_x = sprite_get_width(spr_pause_timer) + 64;
//pause_timer_edge_buffer_y = sprite_get_height(spr_pause_timer) + 64;

//Sets filter
//Takes filter from beginning of the game (may switch to on room start later)
if(layer_get_fx("Filter") != -1){
	fx_filter_unpause = fx_create(fx_get_name(layer_get_fx("Filter")));
}else{
	fx_filter_unpause = -1;
}
fx_filter_pause = fx_create("_filter_greyscale");

