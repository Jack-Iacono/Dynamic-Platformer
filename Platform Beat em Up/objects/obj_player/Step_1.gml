/// @description Animation Stuff

//Calculates Distance from the ground
if(collision_rectangle(x-10 , y , x + 10, y + 100, obj_wall, false,false)){
	ground_height = (collision_rectangle(x-10 , y , x + 10, y + 100, obj_wall, false,false)).y;
}else{
	ground_height = 100000;	
}

ground_dist = ground_height - y;

//jumping animation stuff
if(percent < 1 && jump_anim){
	if(ground_dist > 30){
		percent += 1 / room_speed;
	}else{
		percent += 1 / ground_dist;	
	}
	
	position = animcurve_channel_evaluate(curve, percent);
		
	image_angle = position * -360;
	
	if(percent = 1){
		jump_anim = 0;
		percent = 0;
	}
}

if(place_meeting(x,y+1,obj_wall)){
	image_angle = 0;
	jump_anim = false;
	percent = 0;
}