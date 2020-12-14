Switch1 = 0;
Sigma = pi()/4;
min_Time_Total=0;
min_Path_Total=0;
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
    Trial = 1;
    min_chased=1;

    while (abs(Switch2)<0.1)
        Position = zeros(1000,2,num); % Denote the position of dung beetles
        Round = 1;
        Theta = zeros(1000,1);
        Theta(1,1) = 2*pi()*rand()-pi(); % First assume all dung beetles go towards pi
        Time_Total=zeros(num,1);
        Path_Total=zeros(num,1);
        time=zeros(num,1);
        flag = 0;
        Ori_Round=zeros(100,num);
        
        N_c = 1;
        D_c = 50;
        R_c = 5;
        B_c = Radius;
        V_c = 5.00;
        Position_c = zeros(1000,2,num,N_c);
%         Theta_c = pi();
        Theta_c = zeros(1,N_c);
        Theta_c(1,:) = pi();
        x_partial_c = cos(Theta_c);  
        y_partial_c = sin(Theta_c);
        num_chased = 0;
        num_unchased = 0;
        
        for i = 1:num
            Theta(1,1)=2*pi()*rand()-pi();
            x_partial=cos(Theta(1,1));
            y_partial=sin(Theta(1,1));
            num_unchased = num_unchased + 1;
            for q = 1:N_c
                initial_dist = R_c+(B_c-R_c)*rand();
                initial_angle = 2*pi()*rand();
                Position_c(1,1,i,q) = initial_dist*cos(initial_angle);
                Position_c(1,2,i,q) = initial_dist*sin(initial_angle);
            end
            while (Distance(Position(Round,1,i), Position(Round,2,i)) < Radius)
               [Position(Round+1,1,i), Position(Round+1,2,i)] = Moving(Position(Round,1,i), Position(Round,2,i), Veloc, Delta_t, x_partial, y_partial);
               [Theta(Round+1,1),x_partial,y_partial] = Drifting(Theta(Round,1), Delta_t,Sigma); % Persist Drifting
               for q = 1:N_c
                   if (mod(Round,10)==1 && Round>1)
                       diff_x = Position(Round+1,1,i)-Position_c(Round,1,i,q);
                       diff_y = Position(Round+1,2,i)-Position_c(Round,2,i,q);
                       if (Distance(diff_x,diff_y)<=D_c)
                           Theta_c(1,q) = atan2(diff_y,diff_x);
                           x_partial_c(1,q) = cos(Theta_c(1,q));
                           y_partial_c(1,q) = sin(Theta_c(1,q));
                       else
                           [Theta_c(1,q),x_partial_c(1,q),y_partial_c(1,q)] = Diffusion();
                       end
                   end
                   [Position_c(Round+1,1,i,q),Position_c(Round+1,2,i,q)]=Moving(Position_c(Round,1,i,q),Position_c(Round,2,i,q),V_c,Delta_t,x_partial_c(1,q),y_partial_c(1,q));
                   if (Distance(Position_c(Round+1,1,i,q),Position_c(Round+1,2,i,q)))>=Radius
                       new_radius = 2*Radius-Distance(Position_c(Round+1,1,i,q),Position_c(Round+1,2,i,q));
                       r_angle = atan2(Position_c(Round+1,2,i,q),Position_c(Round+1,1,i,q));
                       Position_c(Round+1,1,i,q) = new_radius*cos(r_angle);
                       Position_c(Round+1,2,i,q) = new_radius*sin(r_angle);
                       new_angle = pi()-atan2(Position_c(Round+1,2,i,q),Position_c(Round+1,1,i,q))-atan2(y_partial_c(1,q),x_partial_c(1,q));
                       x_partial_c(1,q) = cos(new_angle);
                       y_partial_c(1,q) = sin(new_angle);
                   end
               end
               Round = Round + 1;
               Time_Total(i,1) = Time_Total(i,1) + Delta_t;
               Path_Total(i,1) = Path_Total(i,1) + Delta_t * Veloc;
               [flag,Theta(Round,1),x_partial,y_partial] = Test_Adj(x_partial,y_partial,Position(Round,1,i),Position(Round,2,i),Error_Sig);
               if (abs(flag-1)<0.1)
                   [Theta(Round,1),x_partial,y_partial]=Adjust_Dir(Position(Round,1,i),Position(Round,2,i));
%                    f = false;
                   for j = 1:(Time_Pen/Delta_t)
                       for q = 1:N_c
                           Position(Round+1,1,i) = Position(Round,1,i);
                           Position(Round+1,2,i) = Position(Round,2,i);
                           Theta(Round+1,1) = Theta(Round,1);
                           if (mod(Round,10)==1 && Round>1)
                               diff_x = Position(Round+1,1,i)-Position_c(Round,1,i,q);
                               diff_y = Position(Round+1,2,i)-Position_c(Round,2,i,q);
                               if (Distance(diff_x,diff_y)<=D_c)
                                   Theta_c(1,q) = atan2(diff_y,diff_x);
                                   x_partial_c(1,q) = cos(Theta_c(1,q));
                                   y_partial_c(1,q) = sin(Theta_c(1,q));
                               else
                                   [Theta_c(1,q),x_partial_c(1,q),y_partial_c(1,q)] = Diffusion();
                               end
                           end
                           [Position_c(Round+1,1,i,q),Position_c(Round+1,2,i,q)]=Moving(Position_c(Round,1,i,q),Position_c(Round,2,i,q),V_c,Delta_t,x_partial_c(1,q),y_partial_c(1,q));
                           if (Distance(Position_c(Round+1,1,i,q),Position_c(Round+1,2,i,q)))>=Radius
                               new_radius = 2*Radius-Distance(Position_c(Round+1,1,i,q),Position_c(Round+1,2,i,q));
                               r_angle = atan2(Position_c(Round+1,2,i,q),Position_c(Round+1,1,i,q));
                               Position_c(Round+1,1,i,q) = new_radius*cos(r_angle);
                               Position_c(Round+1,2,i,q) = new_radius*sin(r_angle);
                               new_angle = pi()-atan2(Position_c(Round+1,2,i,q),Position_c(Round+1,1,i,q))-atan2(y_partial_c(1,q),x_partial_c(1,q));
                               x_partial_c(1,q) = cos(new_angle);
                               y_partial_c(1,q) = sin(new_angle);
                           end
                       end
                       Round = Round + 1;
%                        x_diff = Position_c(Round,1,i)-Position(Round,1,i);
%                        y_diff = Position_c(Round,2,i)-Position(Round,2,i);
%                        if (Distance(x_diff,y_diff)<=R_c)
%                            num_unchased = num_unchased - 1;
%                            num_chased = num_chased + 1;
%                            f = true;
%                            break;
%                        end
                   end
%                    if (f==true)
%                        break;
%                    end
                   Time_Total(i,1)=Time_Total(i,1)+Time_Pen;
                   time(i,1)=time(i,1)+1;
                   flag = 0;
                   Ori_Round(time(i,1),i)=Round;
               end
               f = false;
               for q = 1:N_c
                   x_diff = Position_c(Round,1,i,q)-Position(Round,1,i);
                   y_diff = Position_c(Round,2,i,q)-Position(Round,2,i);
                   if (Distance(x_diff,y_diff)<=R_c)
                       num_unchased = num_unchased - 1;
                       num_chased = num_chased + 1;
                       f = true;
                   end
                   if f == true
                       break;
                   end
               end
               if f==true
                   break;
               end
            end
            Round=1;
            x_partial = cos(Theta(Round,1));  
            y_partial = sin(Theta(Round,1));
        end
        percent_chased = num_chased/(num_chased+num_unchased);
        if (percent_chased < min_chased)
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
        d = sprintf('Period %f: %f',Error_Sig,num_chased/(num_chased+num_unchased));
        Error_Sig = Error_Sig + pi()/90;
        disp(d);
%         Trial = Write_To_Excel_8(Trial,D_c,R_c,B_c,V_c,Error_Sig,mean(Time_Total),mean(time));
    end
    Sigma = Sigma + pi()/60;    
    if (abs(Sigma-pi()/2-pi()/60)<0.01)
        Switch1 = 1;
    end
    disp(min_Time_Total);
    disp([CI_T1 CI_T2]);
    disp(min_Path_Total);
    disp([CI_L1 CI_L2]);
    disp(min_chased);
end
