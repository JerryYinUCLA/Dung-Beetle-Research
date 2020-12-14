function [ theta, new_x, new_y ] = Adjust_Dir_Err( pos_x, pos_y,Sigma_ADJ )
x = pos_x/sqrt(pos_x^2+pos_y^2);
y = pos_y/sqrt(pos_x^2+pos_y^2);
% theta = Wrapped_Normal(atan2(y,x),1,Sigma_ADJ);
% theta = Truncate_Normal(atan2(y,x),1,Sigma_ADJ);
theta = Truncated_Normal(atan2(y,x),1,Sigma_ADJ);
% theta = rand()*Sigma_ADJ-Sigma_ADJ/2+atan2(y,x);
new_x = cos(theta);
new_y = sin(theta);
end

