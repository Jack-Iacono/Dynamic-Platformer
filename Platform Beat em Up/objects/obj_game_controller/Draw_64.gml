/// @description Show Timer and Hud

draw_set_halign(fa_right);
print_data(view_wport[0] - HUD_edge_buffer, 100, c_white,c_black, font_HUD, 3, 2, string(pause_timer));
