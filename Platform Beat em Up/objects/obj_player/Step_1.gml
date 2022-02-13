/// @description Some more collision

if(!global.pause_player){
	//Calculates whether the player is grounded or not
	if(place_meeting(x,y+1, obj_wall)){
		grounded = true;	
	}else{
		grounded = false;	
	}

	//Determines if the player is colliding with a wall
	wall_jump_collide = collision_rectangle(x + hitbox_offset_x + 10, y + 4, x - hitbox_offset_x - 10, y - 4, obj_wall,false,false);

	if(wall_jump_collide && !grounded && vsp > 0){
		apply_friction = 1;
	}else{
		apply_friction = 0;
	}

	//Calculates horizontal speed
	x_pre = x;
	h_speed = x_pre - x_post;
	x_post = x_pre;

	//Runs Collision Check for moving platform
	moving_collide = collision_rectangle(x + hitbox_offset_x, y + hitbox_offset_y, x - hitbox_offset_x, y - hitbox_offset_y, obj_moving_platform, false, false);
	
	//Sets where player should be moved based on platform position
	if(moving_collide){
		
		//Tells game whether player is on top or below platform (i.e. not on the sides)
		if(x - hitbox_offset_x < moving_collide.x + (moving_collide.sprite_width / 2) && x + hitbox_offset_x > moving_collide.x - (moving_collide.sprite_width / 2)){
			horizontally_aligned = true;
		}else{
			horizontally_aligned = false;
		}
		
		//Distance to move in x direction (only if not under platform)
		if(y - hitbox_offset_y < moving_collide.y + (moving_collide.sprite_height / 2)){
			hsp_move = moving_collide.cur_h_speed;
			
			//Shows whether the player is being pushed by a platform or not
			if(y + (sprite_width / 2) >= moving_collide.y - (moving_collide.sprite_height / 2)){
				x_push = true;
			}else{
				x_push = false;	
			}
			
		}
		
		//Distance to move in y direction
		if(horizontally_aligned){
			if(y < moving_collide.y - (moving_collide.sprite_height / 2)){
			
				vsp_move = moving_collide.cur_v_speed;
				y += vsp_move;
	
				//Moves player up to avoid getting stuck in platform
				while(place_meeting(x,y,obj_moving_platform) && !place_empty(x,y+hitbox_offset_y,obj_wall) && place_empty(x,y-hitbox_offset_y,obj_wall)){
					//This causes player to warp through platforms
					y--;
				}
			
			}else if(y > moving_collide.y + (moving_collide.sprite_height / 2)){
				//Handles colliding with underside of a moving platform
				y += moving_collide.cur_v_speed;
				vsp = 0 + grav;
			}
		}
		
	}else{
		hsp_move = 0;
		vsp_move = 0;
		
		x_push = false;
		
		if(place_meeting(x,y,obj_wall)){
			while(place_meeting(x,y,obj_wall)){
				y--;	
			}
		}
		
	}


	
	//Vertical Collision, may be useless
	if(place_meeting(x,y+vsp_move,obj_wall)){
		
		while(!place_meeting(x, y + sign(vsp_move),obj_wall)){
			y += sign(vsp_move);	
		}
		
		vsp_move = 0;
		
	}
	
	//Move the player to match the platform
	y += vsp_move;

	//Handles being crushed
	if(collision_rectangle(x+ crush_offset_x,y + crush_offset_y,x - crush_offset_x,y - crush_offset_y, obj_wall,false,false)){
		//room_restart();	
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
}

if(global.pause_player){
	image_speed = 0;
}