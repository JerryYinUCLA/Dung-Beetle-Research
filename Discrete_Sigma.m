function [ Sigma,indicator ] = Discrete_Sigma( T,R,R_max )
L = size(T,2);
indicator = ceil(L*R/R_max);
if indicator>L
    indicator=L;
end
Sigma = T(1,int64(indicator));
end

