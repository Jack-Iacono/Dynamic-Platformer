/// @description Initilaizing Variables

//The horizontal and vertical speed that the player has
hsp = 0.0;
vsp = 0.0;

//Sets Jump
up = 0;

//Amount of momentum that the player has
momentum = 0;

//Is the player running or not (1 and 0)
run = 0;

//Sets whther player is being pushed in the x direction
x_push  = false;
horizontally_aligned = false;

//Calculating player speed in game
x_pre = 0;
x_post = 0;
h_speed = 0;

//Need to intialize in order to check for collision
hsp_move = 0;
vsp_move = 0;

//Whether the player is grounded or not
grounded = false;

//Running animation curve
run_curve = animcurve_get(curve_movement_accel);

walk_channel = animcurve_get_channel(run_curve, "player_walk");
run_channel = animcurve_get_channel(run_curve, "player_run");

accel_pos = 0;

//Hitbox Offsets
hitbox_offset_x = (sprite_width / 2) + 5;
hitbox_offset_y = (sprite_height / 2)  + 5;

crush_offset_x = (sprite_width / 2) - 5;
crush_offset_y = (sprite_height/ 2) - 5;

//Sets various player stats
double_jumps_current = jump_max - 1;
