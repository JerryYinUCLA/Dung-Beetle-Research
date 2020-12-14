Switch1 = 0;
Sigma = 15*pi()/60;
min_Time_Total=0;
min_Path_Total=0;
Trial = 1;
min_chased = 1;
while (abs(Switch1)<0.1)
    Switch1 = 1;
    min_time=9999;
    Check_Time=3.0;
    Switch2 = 0;
    
    while (abs(Switch2)<0.1)
        %Switch2 = 1;
        num = 500;
        Position = zeros(1000,2,num); % Denote the position of dung beetles
        Radius = 100;
        Round = 1;
        Veloc = 3.83; % Velocity
        Delta_t = 0.1;    
        Timer = Check_Time/Delta_t; % Use to check
        Time_Pen = 5.0; % Time to adjust direction
        Theta = zeros(1000,1);
        Theta(1,1) = 2*pi()*rand()-pi(); % First assume all dung beetles go towards pi
        Time_Total=zeros(num,1);
        Path_Total=zeros(num,1);
        time=zeros(num,1);% Record the Number of Times or Reorientation
        Ori_Round=zeros(100,num);
        
        N_c = 10;
        D_c = 20;
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
            Theta(1,1)=2*pi()*rand()-pi(); % Randomize the direction
            x_partial=cos(Theta(1,1));
            y_partial=sin(Theta(1,1));
            Timer = Check_Time/Delta_t;
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
               Timer = Timer - 1;
               if abs(Timer)<0.1
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
%                    Round = Round + 1;
                   Time_Total(i,1)=Time_Total(i,1)+Time_Pen;
                   Timer=Check_Time/Delta_t;
                   time(i,1)=time(i,1)+1;
                   Ori_Round(time(i,1),i)=Round;
               end
               flag = false;
               for q = 1:N_c
                   x_diff = Position_c(Round,1,i,q)-Position(Round,1,i);
                   y_diff = Position_c(Round,2,i,q)-Position(Round,2,i);
                   if (Distance(x_diff,y_diff)<=R_c)
                       num_unchased = num_unchased - 1;
                       num_chased = num_chased + 1;
                       flag = true;
                   end
                   if flag==true
                       break;
                   end
               end
               if flag==true
                   break;
               end
            end

%             if i==1
%                 if i==1
%                     figure('name','Path');
%                 end
%                 grid on;
%                 set(gca,'XLim',[-1.2*Radius,1.2*Radius]);
%                 set(gca,'YLim',[-1.2*Radius,1.2*Radius]);
%                 circle1=zeros(81,1);
%                 circle2=zeros(81,1);
%                 k = 1;
%                 for j = 0:pi()/40:2*pi()
%                     circle1(k,1) = Radius*cos(j);
%                     circle2(k,1) = Radius*sin(j);
%                     k = k+1;
%                 end
%                 plot(circle1,circle2,'c','linewidth',1);
%                 axis('square')
%                 hold on;
%                 x = zeros(Round-1,1);
%                 xc = zeros(Round-1,1);
%                 yc = zeros(Round-1,1);
%                 y = zeros(Round-1,1);
%                 fl = false;
%                 for k = 1:(Round - 1);
%                     x(k,1) = Position(k,1,i);
%                     xc(k,1) = Position_c(k,1,i);
%                     y(k,1) = Position(k,2,i);
%                     yc(k,1) = Position_c(k,2,i);
%                     diff = sqrt((x(k,1)-xc(k,1))^2+(y(k,1)-yc(k,1))^2);
%                     if fl==false && diff<=D_c+0.2
%                         pos = [xc(k,1)-D_c yc(k,1)-D_c 2*D_c 2*D_c];
%                         pos_p = [xc(k,1)-1 yc(k,1)-1 2 2];
%                         rectangle('Position',pos,'Curvature',[1 1],'EdgeColor','k','FaceColor',[0 0 0 0.2]);
%                         hold on;
%                         rectangle('Position',pos_p,'Curvature',[1 1],'EdgeColor','k','FaceColor',[0 0 0]);
%                         hold on;
%                         fl = true;
%                     end
%                 end
%                 xlabel('x(cm)','FontSize',18)
%                 ylabel('y(cm)','FontSize',18)
%                 ax = gca;
%                 ax.FontSize = 18; 
%                 d = plot(x,y,'LineWidth',2,'Color','b');
%                 hold on;
%                 c = plot(xc,yc,'r','LineWidth',2);
%                 hold on;
%                 diff = sqrt((x(Round-1,1)-xc(Round-1,1))^2+(y(Round-1,1)-yc(Round-1,1))^2);
%                 pos_s1 = [-2 -2 4 4];
%                 rectangle('Position',pos_s1,'Curvature',[1 1],'EdgeColor','k','FaceColor',[0 0 1]);
%                 pos_s2 = [xc(1,1)-2 yc(1,1)-2 4 4];
%                 rectangle('Position',pos_s2,'Curvature',[1 1],'EdgeColor','k','FaceColor',[1 0 0]);
%                 if diff <= R_c+0.55
%                     pos = [xc(Round-1,1)-R_c yc(Round-1,1)-R_c 2*R_c 2*R_c];
%                     pos_p = [xc(Round-1,1)-1 yc(Round-1,1)-1 2 2];
%                     rectangle('Position',pos,'Curvature',[1 1],'EdgeColor','k','FaceColor',[0 0 0 0.5])
%                     hold on;
%                     rectangle('Position',pos_p,'Curvature',[1 1],'EdgeColor','k','FaceColor',[0 0 0]);
%                     hold on;
%                 end
%                 legend([d c],{'Roller','Searcher'})
%                 hold on;
%             end
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
            min_Int = Check_Time;
            Opt_Time_Total = Time_Total;
            Opt_Path_Total = Path_Total;
            Opt_Path=Position;
            Opt_Orien=Ori_Round;
        end
        if (Check_Time>=10)
            Switch2 = 1;
        end
        d = sprintf('Period %f: %f',Check_Time,num_chased/(num_chased+num_unchased));
        disp(d);
%         Trial = Write_To_Excel_7(Trial,D_c,R_c,B_c,V_c,Check_Time,mean(Time_Total),mean(time));
        Check_Time = Check_Time+0.1;
    end
    Sigma = Sigma + pi()/60;
    if (abs(Sigma-pi()/2-pi()/60)<0.05)
        Switch1 = 1;
    end
    disp(min_Time_Total);
    disp([CI_T1 CI_T2]);
    disp(min_Path_Total);
    disp([CI_L1 CI_L2]);
    disp(min_chased);
end
