function [Ang, Cos_Angle, Sin_Angle ] = Drifting( theta, delta_t, sigma )
Ang = Wrapped_Normal(theta, delta_t, sigma);
Cos_Angle = cos(Ang);
Sin_Angle = sin(Ang);
end

