/// @description Debugging Stuff

draw_rectangle(x+ hitbox_offset_x,y + hitbox_offset_y,x - hitbox_offset_x,y - hitbox_offset_y,true);

draw_text(100,100, "Momentum: " + string(momentum));
draw_text(100,150, "H_Speed: " + string(h_speed));
draw_text(100,200, "Accel_Pos: " + string(accel_pos));
draw_text(100,250, "Accel_Speed: " + string(accel_speed));

