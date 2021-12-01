/// @description Debugging Stuff

draw_rectangle(x+ hitbox_offset_x,y,x - hitbox_offset_x,y - (hitbox_offset_y * 2),true);

draw_text(100,100,string(moving_collide_h));
draw_text(100,120,string(hsp));
draw_text(100,140,string(hsp_move));

