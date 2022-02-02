/// @description Debugging Stuff

//Draws Crushing zone
draw_set_color(c_fuchsia);
draw_rectangle(x+ crush_offset_x,y + crush_offset_y,x - crush_offset_x,y - crush_offset_y,true);

//Draws Y Collision Box
draw_set_color(c_lime);
draw_rectangle(x + hitbox_offset_x - 5,y + hitbox_offset_y,x - hitbox_offset_x + 5,y - hitbox_offset_y,true);

//Draws X Collision Box
draw_set_color(c_teal);
draw_rectangle(x + hitbox_offset_x,y + hitbox_offset_y - 5,x - hitbox_offset_x,y - hitbox_offset_y + 5, true);

//Draws Y collision stuff
draw_circle(x,y+hitbox_offset_y,10,false);
draw_circle(x,y-hitbox_offset_y,10,false);

//Draws Helpful Data
draw_set_color(c_white);
draw_text(100,100, "Momentum: " + string(momentum));
draw_text(100,150, "H_Speed: " + string(h_speed));
draw_text(100,200, "Accel_Pos: " + string(accel_pos));
draw_text(100,250, "Accel_Speed: " + string(accel_speed));
draw_text(100, 300, "Grounded: " + string(place_meeting(x,y+1,obj_wall)));
draw_text(100, 350, "Vsp: " + string(vsp));
draw_text(100, 400, "Hsp: " + string(hsp));
draw_text(100, 450, "Hsp_move: " + string(hsp_move));
draw_text(100, 500, "Vsp_move: " + string(vsp_move));
draw_text(100, 550, "Colliding: " + string(place_meeting(x,y,obj_moving_platform)));
draw_text(100, 600, "Colliding: " + string(!place_empty(x,y+1,obj_wall)));

