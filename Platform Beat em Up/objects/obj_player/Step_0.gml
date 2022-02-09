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

	//All jump variants
	if(keyboard_check_pressed(ord("W"))){
		if(grounded){
			//Regular Jump
			up = 1;
			double_jumps_current = jump_max - 1;
		}else if(wall_jump_collide && !grounded){
			
			if(wall_jump_collide.x > x){
				//Wall jump left
				up = 1;
				hsp = 0;
				momentum = -walk_speed;
				accel_pos = 0;
				accel_speed = 0;
			}else{
				//Wall jump right
				up = 1;
				hsp = 0;
				momentum = walk_speed;
				accel_pos = 0;
				accel_speed = 0;
			}
			
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

if(!global.pause){
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
		if(momentum > 1.0 || momentum < -1.0){
		
			if(place_meeting(x,y+1,obj_wall)){
				//Momentum while grounded
				momentum -= (momentum * 0.1);
			}else{	
				//momentum while in air
				momentum -= (momentum * 0.025);
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