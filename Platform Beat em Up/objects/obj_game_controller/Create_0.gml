/// @description Initializers

global.pause = false;
global.control = true;
global.pause_timer = max_time;
global.debug_menu = false;

//Sets filter
//Takes filter from beginning of the game (may switch to on room start later)
if(layer_get_fx("Filter") != -1){
	fx_filter_unpause = fx_create(fx_get_name(layer_get_fx("Filter")));
}else{
	fx_filter_unpause = -1;
}
fx_filter_pause = fx_create("_filter_greyscale");

