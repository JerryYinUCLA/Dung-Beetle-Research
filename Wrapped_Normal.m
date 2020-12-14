function [ Angle ] = Wrapped_Normal( theta, delta_t, sigma )
Sig = sigma * sqrt(delta_t);
Angle = normrnd(0, Sig);
while (Angle > pi() || Angle <= -pi())
    Angle = normrnd(0, Sig);
end
Angle = Angle + theta;
while (Angle > pi())
    Angle = Angle-2*pi();
end
while (Angle <= -pi())
    Angle = Angle+2*pi();
end

