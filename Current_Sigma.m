function [ Sigma ] = Current_Sigma( Sig_in, Sig_out, R_max, R )
% Sigma = Sig_in + (Sig_out-Sig_in)*R/R_max;
Sigma = Sig_in + (R^2/R_max^2)*(Sig_out-Sig_in);
end

