/// @description Debugging Stuff

draw_rectangle(x+ hitbox_offset_x,y + hitbox_offset_y,x - hitbox_offset_x,y - hitbox_offset_y,true);

draw_text(100,100,string(moving_collide_h));
draw_text(100,120,string(hsp));
draw_text(100,140,string(hsp_move));
draw_text(100,160,string(x_moving_post));
draw_text(100,180,string(x_moving_pre));

