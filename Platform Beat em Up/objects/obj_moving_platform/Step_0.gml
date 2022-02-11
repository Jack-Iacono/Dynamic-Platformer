/// @description Sets how fast the platform is currently moving

if(!global.pause_world){
	if(path_position = 1){
		plat_direction = -1	
	}else if(path_position = 0){
		plat_direction = 1;	
	}
	
	path_speed = plat_direction * (plat_speed * animcurve_channel_evaluate(move_channel,(path_position)));
	
	pre_y = y;
	pre_x = x;

	cur_v_speed = pre_y - post_y;
	cur_h_speed = pre_x - post_x;

	post_y = pre_y;
	post_x = pre_x;
}else{
	path_speed = 0;
}