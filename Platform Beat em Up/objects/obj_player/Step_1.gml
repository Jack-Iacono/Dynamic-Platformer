/// @description Some more collision

//Runs Collision Check for moving platform
moving_collide_h = collision_rectangle(x+ hitbox_offset_x,y + hitbox_offset_y,x - hitbox_offset_x,y - hitbox_offset_y, obj_moving_platform,false,false);
moving_collide_v = instance_place(x,y+vsp,obj_moving_platform);

//Moving Block Collisions
if(moving_collide_h){
	x_moving_pre = moving_collide_h.x;
	
	if(x_moving_post = 0){
		hsp_move = 0;
	}else{
		hsp_move = x_moving_pre - x_moving_post;
	}
	
	x_moving_post = x_moving_pre;
}else{
	hsp_move = 0;
	x_moving_pre = 0;
	x_moving_post = 0;
}

//Moves based on platform
if(moving_collide_v && y <= moving_collide_v.y){
	
	y_moving = (y - moving_collide_v.y) + moving_collide_v.y;
	y = y_moving;
	
	//Moves player up to avoid getting stuck in platform
	while(place_meeting(x,y,obj_moving_platform) && !place_empty(x,y+1,obj_wall)){
		y--;
	}	
}else if(moving_collide_v && y > moving_collide_v.y){
	y += moving_collide_v.cur_v_speed;
	vsp = 0 + grav;
	show_debug_message(string(moving_collide_v.cur_v_speed));
}
