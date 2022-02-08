/// @description Handles Various Things

if(pause_timer == 0 && global.pause){
	global.pause = false;
	if(fx_filter_unpause != -1){
		layer_set_fx("Filter",fx_filter_unpause);
	}else{
		layer_clear_fx("Filter");
	}
}else if(pause_timer > 0 && global.pause){
	pause_timer -= (1 / room_speed) * time_deplete_speed;
}else if(!global.pause){
	if(pause_timer < max_time){
		pause_timer += (1 / room_speed)	* time_regen_speed;
	}else if(pause_timer > max_time){
		pause_timer = max_time;	
	}
}
