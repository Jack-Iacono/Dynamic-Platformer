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
	
	if(!global.pause_world){
		//Runs Collision Check for moving platform
		moving_collide = collision_rectangle(x + hitbox_offset_x, y + hitbox_offset_y, x - hitbox_offset_x, y - hitbox_offset_y, obj_moving_platform, false, false);
	
		//Sets where player should be moved based on platform position
		if(moving_collide){
		
			//Tells whether the player is to the right or left side of the moving platform
			if(x + (sprite_width / 2) < moving_collide.x - (moving_collide.sprite_width / 2)){
				left_moving = true;
				right_moving = false;
			}else if(x - (sprite_width / 2) > moving_collide.x + (moving_collide.sprite_width / 2)){
				right_moving = true;
				left_moving = false;
			}else{
				right_moving = false;	
				left_moving = false;	
			}
		
			//Tells whether the player is above or below the moving platform
			if(y + (sprite_height / 2) - 5 < moving_collide.y - (moving_collide.sprite_height / 2)){
				above_moving = true;
				below_moving = false;
			}else if(y - (sprite_height / 2) + 5 > moving_collide.y + (moving_collide.sprite_height / 2)){
				above_moving = false;
				below_moving = true;
			}else{
				above_moving = false;
				below_moving = false;
			}
		
			//Distance to move in x direction (only if not under platform)
			if(above_moving){
				hsp_move = moving_collide.cur_h_speed;
			}else if(right_moving && moving_collide.cur_h_speed > 0){
				hsp_move = moving_collide.cur_h_speed;
			}else if(left_moving && moving_collide.cur_h_speed < 0){
				hsp_move = moving_collide.cur_h_speed;
			}
		
			//Distance to move in y direction
			if(!right_moving && !left_moving){
				if(above_moving){
			
					vsp_move = moving_collide.cur_v_speed;
	
					//Moves player up to avoid getting stuck in platform
					while(!place_empty(x,y+hitbox_offset_y,obj_wall) && place_empty(x,y-hitbox_offset_y,obj_wall)){
						//This causes player to warp through platforms
						y--;
					}
			
				}else if(below_moving){
					//Handles colliding with underside of a moving platform
					y += moving_collide.cur_v_speed;
					vsp = 0 + grav;
				}
			}
		
		}else{
			hsp_move = 0;
			vsp_move = 0;
			
			x_push = false;
			
			right_moving = false;
			left_moving = false;
			above_moving = false;
			below_moving = false;
			
			//Moves player out of floor when getting off of vertical platforms
			if(place_meeting(x,y,obj_wall)){
				while(place_meeting(x,y,obj_wall)){
					//This causes some issue
					y--;	
				}
			}
		
		}
	
		//Move the player to match the platform
		y += vsp_move;

		//Handles being crushed
		if(collision_rectangle(x+ crush_offset_x,y + crush_offset_y,x - crush_offset_x,y - crush_offset_y, obj_wall,false,false)){
			//room_restart();	
		}
	
		if(place_meeting(x + hsp_move, y, obj_wall)){
		
			while(!place_meeting(x + sign(hsp_move), y, obj_wall)){
				x += sign(hsp_move);	
			}
		
			hsp_move = 0;
		}
		
		x += hsp_move;
		
	}else{
		hsp_move = 0;
		vsp_move = 0;
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