
/// @description Take movement inputs

right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));

if(place_meeting(x,y+1,obj_wall)){
	up = keyboard_check_pressed(ord("W"));
}else{
	up = 0;
}

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

vsp += grav - (jump_height * up);

if(place_meeting(x + hsp, y, obj_wall)){
		
	while(!place_meeting(x + sign(hsp), y, obj_wall)){
		
		x += sign(hsp);
		
	}
	
	hsp = 0;
}

x += hsp;

//Vertical Collision
if(place_meeting(x, y + vsp, obj_wall)){
	
	while(!place_meeting(x, y + sign(vsp), obj_wall)){
		y += sign(vsp);
	}

	vsp = 0;
}


y += vsp;