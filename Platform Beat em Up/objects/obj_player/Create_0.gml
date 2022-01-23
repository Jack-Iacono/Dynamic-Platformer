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

//Not sure I remember, I'll get back to you
hsp_move = 0;

//Running animation curve
run_curve = animcurve_get(curve_movement_accel);

walk_channel = animcurve_get_channel(run_curve, "player_walk");
run_channel = animcurve_get_channel(run_curve, "player_run");

accel_pos = 0;