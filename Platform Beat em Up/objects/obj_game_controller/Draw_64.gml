/// @description Show Timer and Hud

draw_set_halign(fa_right);
//Draws Time in as numbers
//print_data(view_wport[0] - HUD_edge_buffer, 100, c_white,c_black, font_HUD, 3, 2, string(global.pause_timer));

draw_sprite_ext(spr_pause_timer, int64((global.pause_timer / max_time) * 199),view_wport[0] - pause_timer_edge_buffer_x, 0,1,1,0,c_white,1);

//Debug Menu
if(global.debug_menu){
	
	with(obj_player){
		//Sets alignment and font
		draw_set_halign(fa_left);
		draw_set_font(font_debug);

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
		draw_text(100, 200, "Vsp: " + string(vsp));
		draw_text(100, 250, "Hsp: " + string(hsp));
		draw_text(100,350, "Accel_Pos: " + string(accel_pos));
		draw_text(100,400, "Accel_Speed: " + string(accel_speed));
		draw_text(100,450, "Momentum: " + string(momentum));
		draw_text(100,500, "H_Speed: " + string(h_speed));
		draw_text(100, 600, "Hsp_move: " + string(hsp_move));
		draw_text(100, 650, "Vsp_move: " + string(vsp_move));
	}

}