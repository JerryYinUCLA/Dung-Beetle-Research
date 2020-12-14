function [ Sigma,indicator ] = Discrete_Sigma_4( t1,t2,t3,t4,R,R_max )
if (R>=0 && R<=R_max/4)
    Sigma = t1;
    indicator = 1;
elseif (R>R_max/4 && R<=R_max/2)
    Sigma = t2;
    indicator = 2;
elseif (R>R_max/2 && R<=3*R_max/4)
    Sigma = t3;
    indicator = 3;
elseif (R>3*R_max/4)
    Sigma = t4;
    indicator = 4;
end

