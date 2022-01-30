/// @description Insert description here
// You can write your code in this editor

//Changing this can cause player to not be able to jump when on moving platforms
if(moving_collide_v && !place_meeting(x,y+1,obj_wall) && vsp >= 0){
	while(!place_meeting(x,y,obj_moving_platform) &&  collision_rectangle(x + (sprite_width / 2) ,y + 100,x - (sprite_width / 2) ,y, obj_moving_platform,false,false)){
		y++;
	}
}

