/// @description Show Timer and Hud

draw_set_halign(fa_right);

draw_sprite_ext(spr_pause_timer, int64((global.pause_timer / max_time) * 199),view_wport[0] - pause_timer_edge_buffer_x, 0,1,1,0,c_white,1);

//Draws Toggle Display
draw_sprite_ext(pause_sprite_draw, 0,view_wport[0]-74, 10,1,1,0,c_white,1);

//Debug Menu
if(global.debug_menu){
	
	with(obj_player){
		//Sets alignment and font
		draw_set_halign(fa_left);
		draw_set_font(font_debug);

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