/// @description Calculates Speed

pre_y = y;
pre_x = x;

cur_v_speed = pre_y - post_y;
cur_h_speed = pre_x - post_x;

post_y = pre_y;
post_x = pre_x;