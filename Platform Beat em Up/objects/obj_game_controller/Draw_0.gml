/// @description More Debugging

with(obj_player){
	if(global.debug_menu){
		//Draws Moving Collision Hitbox
		draw_set_color(c_lime);
		draw_rectangle(x + hitbox_offset_x, y + hitbox_offset_y, x - hitbox_offset_x, y - hitbox_offset_y, true);
	
		//Draws Sprite Hitbox
		draw_set_color(c_white);
		draw_rectangle(x + sprite_width / 2, y + sprite_height / 2, x - sprite_width / 2, y - sprite_height / 2, true);
	
		//Draws Crushing zone
		draw_set_color(c_fuchsia);
		draw_rectangle(x+ crush_offset_x,y + crush_offset_y,x - crush_offset_x,y - crush_offset_y,true);
	}
}