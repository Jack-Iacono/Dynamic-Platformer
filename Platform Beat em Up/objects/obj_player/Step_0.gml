/// @description Take movement inputs

//Controls pause

if(global.control){
	//Takes Keyboard Input
	right = keyboard_check(ord("D"));
	left = keyboard_check(ord("A"));
	
	//Running Switch
	if(keyboard_check_pressed(vk_shift)){
		if(run = 0){
			run = 1;	
		}else{
			run = 0;
		}
	}
	
	//Increments along accel curve given current speed
	if((right || left) && accel_pos < 1){
		if(grounded){
			accel_pos += grounded_acceleration;
		}else{
			accel_pos += air_acceleration;
		}
	}else if(!right && !left){
		accel_pos = 0;	
	}

	//Calculates movement and acceleration
	if(run){
		hsp = (right - left) * run_speed;
		accel_speed = animcurve_channel_evaluate(run_channel,accel_pos);
		hsp *= accel_speed;
	}else{
		hsp = (right - left) * walk_speed;
		accel_speed = animcurve_channel_evaluate(walk_channel,accel_pos);
		hsp *= accel_speed;
	}
	
	if(sign(hsp) != sign(momentum)){
		accel_pos = 0.5;
	}

	//All jump variants
	if(keyboard_check_pressed(ord("W"))){
		if(grounded){
			//Regular Jump
			up = 1;
			double_jumps_current = jump_max - 1;
		}else if(wall_jump_collide && !grounded){
			
			if(wall_jump_collide.x > x){
				//Wall jump left
				if(run){
					hsp = -run_speed;
					momentum = -run_speed;
				}else{
					hsp = -walk_speed;
					momentum = -walk_speed;
				}
				left = true;

			}else{
				//Wall jump right
				if(run){
					hsp = run_speed;
					momentum = run_speed;
				}else{
					hsp = walk_speed;
					momentum = walk_speed;
				}
				right = true;
			}
			
			//Designates Jumping
			up = 1;
			
			//Ensures that there is no choppiess when switch directions (Not really, but okay)
			accel_pos = 1;
			accel_speed = 1;
			
			alarm[0] = room_speed * wall_jump_cooldown;
			global.control = false;
		}else if(double_jumps_current > 0 && !grounded){
			//Double Jump
			up = 1;
			if(up == 1){
				double_jumps_current--;
			}
		}else{
			//No Jump
			up = 0;
		}
		
	}else{
		//No jump
		up = 0;	
	}
}else{
	//No Jump
	up = 0;
}

if(!global.pause_player){
	//Collision with time_zone
	if(place_meeting(x, y, obj_time_zone)){
		global.pause_mode = 0;
		global.pause = false;
	}else if(!place_meeting(x, y, obj_time_zone) && global.pause_mode = 0){
		global.pause_mode = 1;	
	}
	
	//Gravity and Jump stuff
	if(up != 0){
		//Sets vsp to jump and negates gravity temporarily
		vsp = -(jump_height * up);
	}else{
		//Applies gravity and friction
		if(apply_friction && vsp >= 0){
			vsp += grav * wall_friction;
		}else{
			vsp += grav;
		}
	}

	//Calculates Momentum
	if(hsp != 0){
		momentum = h_speed - hsp_move;	
	}else{
		if(momentum > 0.1 || momentum < -0.1){
		
			if(place_meeting(x,y+1,obj_wall)){
				//Momentum while grounded
				momentum -= (momentum * grounded_momentum_decrease);
			}else{	
				//momentum while in air
				momentum -= (momentum * air_momentum_decrease);
			}
		}else{
			momentum = 0;	
		}
	}

	//Runs Collision for movement via input
	if(place_meeting(x + hsp, y, obj_wall)){
		
		while(!place_meeting(x + sign(hsp), y, obj_wall)){
			
			x += sign(hsp);
		
		}

		hsp = 0;
	}

	//Runs collision check for momentum
	if(place_meeting(x + momentum, y, obj_wall)){
		
		while(!place_meeting(x + sign(momentum), y, obj_wall)){
		
			x += sign(momentum);
		
		}

		momentum = 0;
	}
	
	//Negates movement if being pushed
	if(x_push){
		if(sign(hsp) = -1 * sign(hsp_move)){
			momentum = 0;
			hsp = 0;
		}
		
		if(x > moving_collide.x && sign(hsp_move) = -1){
			hsp_move = 0;	
		}else if(x < moving_collide.x && sign(hsp_move) = 1){
			hsp_move = 0;	
		}
	}

	//Actually Moves the Player
	if(hsp = 0){
		x += momentum + hsp_move;
	}else{
		x += hsp + hsp_move;
	}

	//Vertical Collision
	if(place_meeting(x, y + vsp, obj_wall)){
	
		while(!place_meeting(x, y + sign(vsp), obj_wall)){
			y += sign(vsp);
		}

		vsp = 0;
	}


	y += vsp;
}else if(global.pause){
	//Idk maybe I'll do soemthing here	
}