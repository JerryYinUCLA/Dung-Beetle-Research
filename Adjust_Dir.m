function [ theta, new_x, new_y ] = Adjust_Dir( pos_x, pos_y )
new_x = pos_x/sqrt(pos_x^2+pos_y^2);
new_y = pos_y/sqrt(pos_x^2+pos_y^2);
theta = atan2(new_y,new_x);
end

