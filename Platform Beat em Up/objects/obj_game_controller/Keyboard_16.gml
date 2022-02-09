/// @description Activates Debug Menu

toggle = keyboard_check_pressed(vk_add);


if(toggle){
	
	if(global.debug_menu = false){
		global.debug_menu = true;
	}else{
		global.debug_menu = false;	
	}
	
}