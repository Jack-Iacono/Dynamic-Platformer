/// @description Insert description here
// You can write your code in this editor

if(!global.pause){
	
	if(moving_collide && !place_meeting(x,y+1,obj_wall) && vsp >= 0){
		while(!place_meeting(x,y,obj_moving_platform) &&  collision_rectangle(x + (sprite_width / 2) ,y + 100,x - (sprite_width / 2) ,y, obj_moving_platform,false,false)){
			y++;
		}
	}
}

