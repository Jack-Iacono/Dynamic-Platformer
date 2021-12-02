/// @description Debugging Stuff

draw_rectangle(x+ hitbox_offset_x,y + hitbox_offset_y,x - hitbox_offset_x,y - hitbox_offset_y,true);

draw_text(100,100,string(moving_collide_h));
draw_text(100,120,string(place_empty(x,y+5,obj_wall)));

