function [ Prob_list ] = NORM_CDF_G( dir, delta_t, sigma, num_diff )
Prob_list = zeros(num_diff,1);
Sig = sigma*sqrt(delta_t);
for i=1:num_diff
%     if i==1
%         for j = -3:3
%             Prob_list(i,1) = Prob_list(i,1)+normcdf(-pi+pi/num_diff+2*j*pi,dir,Sig)-...
%                 normcdf(-pi+2*j*pi,dir,Sig);
%             Prob_list(i,1) = Prob_list(i,1)+normcdf(pi+2*j*pi,dir,Sig)-...
%                 normcdf(pi-pi/num_diff+2*j*pi,dir,Sig);
%         end
%     else
    for j = -3:3
        Prob_list(i,1) = Prob_list(i,1)+normcdf(-pi-pi/num_diff+i*2*pi/num_diff+2*j*pi,dir,Sig)-...
             normcdf(-pi-pi/num_diff+(i-1)*2*pi/num_diff+2*j*pi,dir,Sig);
    end
%     end
end