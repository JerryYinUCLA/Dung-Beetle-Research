Switch1 = 0;
Sigma = 15*pi()/60;
min_Time_Total=0;
min_Path_Total=0;
Trial = 1;
min_chased=1;
while (abs(Switch1)<0.1)
    Switch1=1;
    min_time=9999;
    Error_Sig = pi()/90;
    Switch2 = 0;
    Time_Pen = 5;
    num = 500;
    Radius = 100;
    Veloc = 3.83; % Velocity                    
    Delta_t = 0.1;  

    while (abs(Switch2)<0.1)
%         Switch2 = 1;
        Position = zeros(1000,2,num); % Denote the position of dung beetles
        Round = 1;
        Theta = zeros(1000,1);
        Theta(1,1) = 2*pi()*rand()-pi(); % First assume all dung beetles go towards pi
        Time_Total=zeros(num,1);
        Path_Total=zeros(num,1);
        time=zeros(num,1);
        flag = 0;
        Ori_Round=zeros(100,num);
        
        D_c = 20;
        R_c = 5;
        B_c = 100;
        V_c = 5.00;
        Position_c = zeros(1000,2,num);
        Theta_c = pi();
        x_partial_c = cos(Theta_c);  
        y_partial_c = sin(Theta_c);
        num_chased = 0;
        num_unchased = 0;
        
        for i = 1:num
            Theta(1,1)=2*pi()*rand()-pi();
            x_partial=cos(Theta(1,1));
            y_partial=sin(Theta(1,1));
            num_unchased = num_unchased + 1;
            initial_dist = R_c+(B_c-R_c)*rand();
            initial_angle = 2*pi()*rand();
            Position_c(1,1,i) = initial_dist*cos(initial_angle);
            Position_c(1,2,i) = initial_dist*sin(initial_angle);
            
            while (Distance(Position(Round,1,i), Position(Round,2,i)) < Radius)
                Error_Sig_Noise = normrnd(0,10*pi()/90);
                while abs(Error_Sig_Noise)>Error_Sig
                    Error_Sig_Noise = normrnd(0,10*pi()/90);
                end
                Error_Sig_temp = Error_Sig + Error_Sig_Noise;
               [Position(Round+1,1,i), Position(Round+1,2,i)] = Moving(Position(Round,1,i), Position(Round,2,i), Veloc, Delta_t, x_partial, y_partial);
               [Theta(Round+1,1),x_partial,y_partial] = Drifting(Theta(Round,1), Delta_t,Sigma); % Persist Drifting
               if (mod(Round,10)==1 && Round>1)
                   diff_x = Position(Round+1,1,i)-Position_c(Round,1,i);
                   diff_y = Position(Round+1,2,i)-Position_c(Round,2,i);
                   if (Distance(diff_x,diff_y)<=D_c)
                       Theta_c = atan2(diff_y,diff_x);
                       x_partial_c = cos(Theta_c);
                       y_partial_c = sin(Theta_c);
                   else
                       [Theta_c,x_partial_c,y_partial_c] = Diffusion();
                   end
               end
               [Position_c(Round+1,1,i),Position_c(Round+1,2,i)]=Moving(Position_c(Round,1,i),Position_c(Round,2,i),V_c,Delta_t,x_partial_c,y_partial_c);
               if (Distance(Position_c(Round+1,1,i),Position_c(Round+1,2,i)))>=Radius
                   new_radius = 2*Radius-Distance(Position_c(Round+1,1,i),Position_c(Round+1,2,i));
                   r_angle = atan2(Position_c(Round+1,2,i),Position_c(Round+1,1,i));
                   Position_c(Round+1,1,i) = new_radius*cos(r_angle);
                   Position_c(Round+1,2,i) = new_radius*sin(r_angle);
                   new_angle = pi()-atan2(Position_c(Round+1,2,i),Position_c(Round+1,1,i))-atan2(y_partial_c,x_partial_c);
                   x_partial_c = cos(new_angle);
                   y_partial_c = sin(new_angle);
               end
               
               Round = Round + 1;
               Time_Total(i,1) = Time_Total(i,1) + Delta_t;
               Path_Total(i,1) = Path_Total(i,1) + Delta_t * Veloc;
               [flag,Theta(Round,1),x_partial,y_partial] = Test_Adj(x_partial,y_partial,Position(Round,1,i),Position(Round,2,i),Error_Sig_temp);
               if (abs(flag-1)<0.1)
                   [Theta(Round,1),x_partial,y_partial]=Adjust_Dir(Position(Round,1,i),Position(Round,2,i));
                   f = false;
                   for j = 1:(Time_Pen/Delta_t)
                       Position(Round+1,1,i) = Position(Round,1,i);
                       Position(Round+1,2,i) = Position(Round,2,i);
                       Theta(Round+1,1) = Theta(Round,1);
                       if (mod(Round,10)==1 && Round>1)
                           diff_x = Position(Round+1,1,i)-Position_c(Round,1,i);
                           diff_y = Position(Round+1,2,i)-Position_c(Round,2,i);
                           if (Distance(diff_x,diff_y)<=D_c)
                               Theta_c = atan2(diff_y,diff_x);
                               x_partial_c = cos(Theta_c);
                               y_partial_c = sin(Theta_c);
                           else
                               [Theta_c,x_partial_c,y_partial_c] = Diffusion();
                           end
                       end
                       [Position_c(Round+1,1,i),Position_c(Round+1,2,i)]=Moving(Position_c(Round,1,i),Position_c(Round,2,i),V_c,Delta_t,x_partial_c,y_partial_c);
                       if (Distance(Position_c(Round+1,1,i),Position_c(Round+1,2,i)))>=Radius
                           new_radius = 2*Radius-Distance(Position_c(Round+1,1,i),Position_c(Round+1,2,i));
                           r_angle = atan2(Position_c(Round+1,2,i),Position_c(Round+1,1,i));
                           Position_c(Round+1,1,i) = new_radius*cos(r_angle);
                           Position_c(Round+1,2,i) = new_radius*sin(r_angle);
                           new_angle = pi()-atan2(Position_c(Round+1,2,i),Position_c(Round+1,1,i))-atan2(y_partial_c,x_partial_c);
                           x_partial_c = cos(new_angle);
                           y_partial_c = sin(new_angle);
                       end
                       Round = Round + 1;
                       x_diff = Position_c(Round,1,i)-Position(Round,1,i);
                       y_diff = Position_c(Round,2,i)-Position(Round,2,i);
                       if (Distance(x_diff,y_diff)<=R_c)
                           num_unchased = num_unchased - 1;
                           num_chased = num_chased + 1;
                           f = true;
                           break;
                       end
                   end
                   if (f==true)
                       break;
                   end
                   Time_Total(i,1)=Time_Total(i,1)+Time_Pen;
                   time(i,1)=time(i,1)+1;
                   flag = 0;
                   Ori_Round(time(i,1),i)=Round;
               end
               x_diff = Position_c(Round,1,i)-Position(Round,1,i);
               y_diff = Position_c(Round,2,i)-Position(Round,2,i);
               if (Distance(x_diff,y_diff)<=R_c)
                   num_unchased = num_unchased - 1;
                   num_chased = num_chased + 1;
                   break;
               end
            end
            Round=1;
            x_partial = cos(Theta(Round,1));  
            y_partial = sin(Theta(Round,1));
            
        end
        
        percent_chased = num_chased/(num_chased+num_unchased);
        if (percent_chased < min_chased)
            min_time = mean(Time_Total);
            min_chased = percent_chased;
            min_Time_Total = mean(Time_Total);
            min_Path_Total = mean(Path_Total);
            mean_check = mean(time);
            CI_T1 = mean(Time_Total)-1.96*sqrt(var(Time_Total)/num);
            CI_T2 = mean(Time_Total)+1.96*sqrt(var(Time_Total)/num);
            CI_L1 = mean(Path_Total)-1.96*sqrt(var(Path_Total)/num);
            CI_L2 = mean(Path_Total)+1.96*sqrt(var(Path_Total)/num);
            min_Err = Error_Sig;
            Opt_Time_Total = Time_Total;
            Opt_Path_Total = Path_Total;
            Opt_Path=Position;
            Opt_Orien=Ori_Round;
        end
        if (abs(Error_Sig-pi()+pi()/90)<0.01)
            Switch2 = 1;
        end
        Error_Sig = Error_Sig + pi()/90;
        d = sprintf('Error %f, Period %f: %f',Sigma,Error_Sig,percent_chased);
        disp(d);
    end
    Sigma = Sigma + pi()/60;    
%     Trial = Write_To_Excel_10(Trial,D_c,R_c,B_c,V_c,Sigma,min_Err,min_chased,mean_check);
    if (abs(Sigma-pi()/2-pi()/60)<0.01)
        Switch1 = 1;
    end
end
