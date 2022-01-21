/// @description Take movement inputs


//Takes Keyboard Input
right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));

//Jumps if on the ground
if(place_meeting(x,y+1,obj_wall)){
	up = keyboard_check_pressed(ord("W"));
}else{
	up = 0;
}

//Running Switch
if(keyboard_check_pressed(vk_shift)){
	if(run = 0){
		run = 1;	
	}else{
		run = 0;
	}
}

//Calculates movement
if(run){
	hsp = (right - left) * run_speed;
}else{
	hsp = (right - left) * walk_speed;
}

//Calculates Momentum
if(hsp != 0){
	momentum = h_speed;	
}else{
	if(momentum > 1.0 || momentum < -1.0){
		momentum -= (momentum * 0.1);	
	}else{
		momentum = 0;	
	}
}

//Applies Gravity
vsp += grav - (jump_height * up);

//Stationary Block Collisions
if(place_meeting(x + hsp, y, obj_wall)){
		
	while(!place_meeting(x + sign(hsp), y, obj_wall)){
		
		x += sign(hsp);
		
	}
	
	hsp = 0;
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