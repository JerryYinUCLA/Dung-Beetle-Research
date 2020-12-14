function [ Angle, Cos_Angle, Sin_Angle ] = Bimodal_Drifting( theta, mean, delta_t, sigma )
Sig = sigma * sqrt(delta_t);
Angle1 = normrnd(theta+mean, Sig);
Angle2 = normrnd(theta-mean,Sig);
if (abs(Angle1-theta)>abs(Angle2-theta))
    Angle = theta+Angle1-Angle2;
else
    Angle = theta+Angle2-Angle1;
end;
while (Angle > pi() || Angle <= -pi())
    if (Angle > pi())
        Angle = Angle - 2*pi();
    else
        Angle = Angle + 2*pi();
    end
end;
Cos_Angle=cos(Angle);
Sin_Angle=sin(Angle);
end

