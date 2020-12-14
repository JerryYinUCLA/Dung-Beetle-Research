function [ Prob ] = NORM_CDF( dir, delta_t, sigma, type )
Prob = 0;
Sig = sigma*sqrt(delta_t);
if type==1
    for i = -3:3
        Prob = Prob+normcdf(pi/4+2*i*pi,dir,Sig)-normcdf(-pi/4+2*i*pi,dir,Sig);
    end
elseif type==2
    for i = -3:3
        Prob = Prob+normcdf(3*pi/4+2*i*pi,dir,Sig)-normcdf(pi/4+2*i*pi,dir,Sig);
    end
elseif type==3
    for i = -3:3
        Prob = Prob+normcdf(pi+2*i*pi,dir,Sig)-normcdf(3*pi/4+2*i*pi,dir,Sig);
        Prob = Prob+normcdf(-3*pi/4+2*i*pi,dir,Sig)-normcdf(-pi+2*i*pi,dir,Sig);
    end
elseif type==4
    for i = -3:3
        Prob = Prob+normcdf(-pi/4+2*i*pi,dir,Sig)-normcdf(-3*pi/4+2*i*pi,dir,Sig);
    end
end

end

