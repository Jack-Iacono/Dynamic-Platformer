/// @description Handles Various Things


//DEals with setting filter while paused and changing back when unpaused
if(global.pause_timer == 0 && global.pause){
	global.time_regen_allowed = false;
	alarm[0] = room_speed * time_regen_delay;
	global.pause = false;
	if(fx_filter_unpause != -1){
		layer_set_fx("Filter",fx_filter_unpause);
	}else{
		layer_clear_fx("Filter");
	}
}else if(global.pause_timer > 0 && global.pause){
	global.pause_timer -= (1 / room_speed) * time_deplete_speed;
}else if(!global.pause){
	if(global.pause_timer < max_time && global.time_regen_allowed){
		global.pause_timer += (1 / room_speed)	* time_regen_speed;
	}else if(global.pause_timer > max_time){
		global.pause_timer = max_time;	
	}
}

//Assigns Which Pause is Active at a given time
if(global.pause && global.pause_enable){
	
	if(pause_mode = 0){
		global.pause_player = true;
	}else if(pause_mode = 1){
		global.pause_world = true;
	}
	
}else{
	
	if(pause_mode = 0){
		global.pause_player = false;
	}else if(pause_mode = 1){
		global.pause_world = false;
	}
	
}

//Sets HUD image
if(pause_mode = 0){
	pause_sprite_draw = spr_player_icon;
}else if(pause_mode = 1){
	pause_sprite_draw = spr_world_icon;
}