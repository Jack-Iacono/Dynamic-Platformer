/// @description Initialize variables

path_start(path_name, plat_speed, path_action_reverse, false);

post_y = y;
post_x = x;

//Acceleration Along Paths
move_channel = animcurve_get_channel(accel_curve, accel_curve_variant);

//Sets Direction that platform is moving
plat_direction = 1;