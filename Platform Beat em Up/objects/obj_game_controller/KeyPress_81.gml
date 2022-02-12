/// @description Toggle Between Pause States

if(!global.pause && global.pause_mode != 0){
	
	if(global.pause_mode < 2 && global.pause_mode > 0){
		global.pause_mode++;
	}else{
		global.pause_mode = 1;
	}
	
}