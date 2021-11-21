// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Animation_Jump(obj){
	
	show_debug_message("Ran Jump Animation");
	
	with(obj){
		percent = 0;
		curve = animcurve_get_channel(jump_curve, "player");

		//jumping animation stuff
		while(percent < 1){
			percent += 1 / room_speed;
	
			position = animcurve_channel_evaluate(curve, percent);
		
			image_angle = position * 180;
		}
	}

}