/// @description Some more collision

//Runs Collision Check for moving platform
moving_collide_h = collision_rectangle(x-1,x+1,y-1,y+1,obj_moving_platform,false,false);
moving_collide_v = instance_place(x,y+vsp,obj_moving_platform);

if(moving_collide_h){
	x_moving = (x - moving_collide_h.x) + moving_collide_h.x;
	x = x_moving;
}

if(moving_collide_v){
	y_moving = (y - moving_collide_v.y) + moving_collide_v.y;
	y = y_moving;
	
	while(place_meeting(x,y,obj_moving_platform)){
		y--;	
	}	
}
