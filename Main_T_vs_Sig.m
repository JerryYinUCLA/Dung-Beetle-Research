Switch1 = 0;
Sigma = 15*pi()/60;
min_Time_Total=0;
min_Path_Total=0;
while (abs(Switch1)<0.1)
    Switch1 = 1;
    Trial_Num = 1;
    min_time=9999;
    Check_Time=0.2;
    Switch2 = 0;
%     Time_Pen = 5;
%     num = 250;
%     Position = zeros(1000,2,num); % Denote the position of dung beetles
%     Radius = 100;
%     Round = 1;
%     Veloc = 3.83; % Velocity
%     Delta_t = 0.1;
%     Theta = zeros(1000,1);
%     Theta(1,1) = pi(); % First assume all dung beetles go towards pi
%     Time_Total=zeros(num,1);
%     Path_Total=zeros(num,1);
        
%     x_partial = cos(Theta(1,1));  
%     y_partial = sin(Theta(1,1));
    
%     for i = 1:num
%        while (Distance(Position(Round,1,i), Position(Round,2,i)) < Radius)
%             [Position(Round+1,1,i), Position(Round+1,2,i)] = Moving(Position(Round,1,i), Position(Round,2,i), Veloc, Delta_t, x_partial, y_partial);
%             [Theta(Round+1,1),x_partial,y_partial] = Drifting(Theta(Round,1), Delta_t,Sigma); % Persist Drifting
% %           [Theta(Round+1,1),x_partial,y_partial] = Unbiased_Drifting(); % Unbiased Drifting
% %           [Theta(Round+1,1),x_partial,y_partial] = Bimodal_Drifting(Theta(Round,1),2*Sigma,Delta_t, Sigma); %Bimodal Drifting
%             Round = Round + 1;
%             Time_Total(i,1) = Time_Total(i,1) + Delta_t;
%             Path_Total(i,1) = Path_Total(i,1) + Delta_t * Veloc;
%        end   
%        Round=1;
%        x_partial = cos(Theta(Round,1));  
%        y_partial = sin(Theta(Round,1));
%     end
%     Time_T = mean(Time_Total);
%     Path_T = mean(Path_Total);
%     CI_T1 = mean(Time_Total)-1.96*sqrt(var(Time_Total)/num);
%     CI_T2 = mean(Time_Total)+1.96*sqrt(var(Time_Total)/num);
%     CI_L1 = mean(Path_Total)-1.96*sqrt(var(Path_Total)/num);
%     CI_L2 = mean(Path_Total)+1.96*sqrt(var(Path_Total)/num);
%     Trial_Num = Write_To_Excel_3(Trial_Num,'Persist',Radius,Veloc,Delta_t,Sigma,num,Time_Pen,0,Time_T,Path_T,CI_T1,CI_T2,CI_L1,CI_L2,0);
    while (abs(Switch2)<0.1)
%         Switch2 = 1;
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
 
        
        for i = 1:num
            Theta(1,1)=2*pi()*rand()-pi(); % Randomize the direction
            x_partial=cos(Theta(1,1));
            y_partial=sin(Theta(1,1));
            Timer = Check_Time/Delta_t;
            while (Distance(Position(Round,1,i), Position(Round,2,i)) < Radius)
               [Position(Round+1,1,i), Position(Round+1,2,i)] = Moving(Position(Round,1,i), Position(Round,2,i), Veloc, Delta_t, x_partial, y_partial);
               [Theta(Round+1,1),x_partial,y_partial] = Drifting(Theta(Round,1), Delta_t,Sigma); % Persist Drifting
%                 [Theta(Round+1,1),x_partial,y_partial] = Bimodal_Drifting(Theta(Round,1),2*Sigma,Delta_t, Sigma); %Bimodal Drifting
               Round = Round + 1;
               Time_Total(i,1) = Time_Total(i,1) + Delta_t;
             Path_Total(i,1) = Path_Total(i,1) + Delta_t * Veloc;
               Timer = Timer - 1;
               if abs(Timer)<0.1
                   [Theta(Round,1),x_partial,y_partial]=Adjust_Dir(Position(Round,1,i),Position(Round,2,i));
                   Time_Total(i,1)=Time_Total(i,1)+Time_Pen;
                   Timer=Check_Time/Delta_t;
                   time(i,1)=time(i,1)+1;
                   Ori_Round(time(i,1),i)=Round;
               end
            end
            Round=1;
            x_partial = cos(Theta(Round,1));  
            y_partial = sin(Theta(Round,1));
        end
        if (min_time>mean(Time_Total))
            min_time = mean(Time_Total);
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
        if (Sigma<pi()/4)&&(Check_Time>=15)
            Switch2 = 1;
        else if (Check_Time>=10)
                Switch2 = 1;
            end
        end
        CI_T1 = mean(Time_Total)-1.96*sqrt(var(Time_Total)/num);
        CI_T2 = mean(Time_Total)+1.96*sqrt(var(Time_Total)/num);
        CI_L1 = mean(Path_Total)-1.96*sqrt(var(Path_Total)/num);
        CI_L2 = mean(Path_Total)+1.96*sqrt(var(Path_Total)/num);
        Trial_Num = Write_To_Excel_3(Trial_Num,'Persist',Radius,Veloc,Delta_t,Sigma,num,Time_Pen,Check_Time,mean(Time_Total),mean(Path_Total),CI_T1,CI_T2,CI_L1,CI_L2,mean(time));
        Check_Time = Check_Time+0.1;
    end
    Sigma = Sigma + pi()/60;
    if (abs(Sigma-pi()/2-pi()/60)<0.05)
        Switch1 = 1;
    end
end
