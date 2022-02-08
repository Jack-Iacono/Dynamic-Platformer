// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_misc_function(){
	
	function pause_player_toggle(fx_filter_pause, fx_filter_unpause){
		
		if(!global.pause){
			global.pause = true;
			layer_set_fx("Filter",fx_filter_pause);
		}else{
			global.pause = false;
			if(fx_filter_unpause != -1){
				layer_set_fx("Filter",fx_filter_unpause);
			}else{
				layer_clear_fx("Filter");
			}
		}
		
	}
	
	
	function unpause_player(fx_filter_unpause){

		global.pause = false;
		if(fx_filter_unpause != -1){
			layer_set_fx("Filter",fx_filter_unpause);
		}else{
			layer_clear_fx("Filter");
		}
		
	}
	
}