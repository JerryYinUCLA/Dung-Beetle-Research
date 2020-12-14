function [ Angle ] = Truncate_Normal( theta, delta_t, sigma )
Sig = sigma * sqrt(delta_t);
Angle = normrnd(0, Sig);
Angle = Angle+theta;
while (Angle > pi())
    Angle = Angle-2*pi();
end
while (Angle <= -pi())
    Angle = Angle+2*pi();
end
end

