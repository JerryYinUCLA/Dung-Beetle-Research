function [ Angle ] = Truncated_Normal( theta, delta_t, sigma )
Sig = sigma * sqrt(delta_t);
pd=makedist('Normal','mu',theta,'sigma',Sig);
t=truncate(pd,theta-pi,theta+pi);
Angle=random(t,1,1);
end

