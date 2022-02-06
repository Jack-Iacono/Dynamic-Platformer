/// @description Some more collision

//Calculates whether the player is grounded or not
if(place_meeting(x,y+1, obj_wall)){
	grounded = true;	
}else{
	grounded = false;	
}

//Determines if the player is colliding with a wall
wall_jump_collide =collision_rectangle(x + hitbox_offset_x + 10, y + 4, x - hitbox_offset_x - 10, y - 4, obj_wall,false,false);

//Calculates horizontal speed
x_pre = x;
h_speed = x_pre - x_post;
x_post = x_pre;

//Runs Collision Check for moving platform
moving_collide_h = collision_rectangle(x + hitbox_offset_x, y + hitbox_offset_y - 4, x - hitbox_offset_x, y - hitbox_offset_y + 4, obj_moving_platform,false,false);
moving_collide_v = collision_rectangle(x + hitbox_offset_x - 5, y + hitbox_offset_y,x - hitbox_offset_x + 5,y - hitbox_offset_y, obj_moving_platform,false,false);


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
	
	vsp_move = (y - moving_collide_v.y) + moving_collide_v.y;
	y = vsp_move;
	
	//Moves player up to avoid getting stuck in platform
	while(place_meeting(x,y,obj_moving_platform) && !place_empty(x,y+hitbox_offset_y,obj_wall) && place_empty(x,y-hitbox_offset_y,obj_wall)){
		//This causes player ot warp through platforms
		y--;
	}
	
}else if(moving_collide_v && y > moving_collide_v.y){
	//Handles colliding with underside of a moving platform
	y += moving_collide_v.cur_v_speed;
	vsp = 0 + grav;
}

//Moves out of floor if stuck from vertical platform
if(place_meeting(x,y,obj_wall) && !(moving_collide_h || moving_collide_v)){
	while(place_meeting(x,y,obj_wall)){
		y--;	
	}
}

//Stops moving if colliding with wall
if(place_meeting(x + hsp_move, y, obj_wall)){
	
	while(!place_meeting(x + sign(hsp_move), y, obj_wall)){
		x += sign(hsp_move);	
	}
	hsp_move = 0;
	
}

//Handles being crushed
if(collision_rectangle(x+ crush_offset_x,y + crush_offset_y,x - crush_offset_x,y - crush_offset_y, obj_wall,false,false)){
	room_restart();	
}


//Animation Stuff
if(hsp > 0 && grounded){
	image_speed = hsp / 3;
	sprite_index = spr_player_run;
	image_xscale = 1;
}else if(hsp < 0 && grounded){
	image_speed = hsp / 3;
	sprite_index = spr_player_run;
	image_xscale = -1;
}else if(h_speed > 0 && grounded){
	
}else if(h_speed < 0 && grounded){

}else{
	image_speed = 1;
	sprite_index = spr_player_idle;	
}