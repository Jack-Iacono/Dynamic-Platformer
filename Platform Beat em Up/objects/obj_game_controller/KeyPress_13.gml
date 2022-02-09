/// @description Pauses and un-pauses game

if(global.pause_timer > 0){
	if(!global.pause){
		global.pause = true;
		layer_set_fx("Filter",fx_filter_pause);
	}else{
		global.time_regen_allowed = false;
		alarm[0] = room_speed * time_regen_delay;
		global.pause = false;
		if(fx_filter_unpause != -1){
			layer_set_fx("Filter",fx_filter_unpause);
		}else{
			layer_clear_fx("Filter");
		}
	}
}else{
	global.pause = false;
	if(fx_filter_unpause != -1){
			layer_set_fx("Filter",fx_filter_unpause);
	}else{
			layer_clear_fx("Filter");
	}
}

