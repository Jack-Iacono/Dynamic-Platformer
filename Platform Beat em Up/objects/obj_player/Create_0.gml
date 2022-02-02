/// @description Initilaizing Variables

//The horizontal and vertical speed that the player has
hsp = 0.0;
vsp = 0.0;

//Amount of momentum that the player has
momentum = 0;

//Is the player running or not (1 and 0)
run = 0;

//Moving Platform Stuff
x_moving_pre = 0;
x_moving_post = 0;

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