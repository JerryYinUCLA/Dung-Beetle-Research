function [ Radius,Veloc,Delta_t,Sigma,num,Time_Pen,min_Int,min_Time_Total,min_Path_Total,CI_T1,CI_T2,CI_L1,CI_L2 ] = Main_T_vs_Sig( Trial_Num,num,Radius,Veloc,Delta_t,Time_Pen,Check_Time,Sigma  )
Position = zeros(1000,2,num); % Denote the position of dung beetles
Round = 1;
Theta = zeros(1000,1);
Theta(1,1) = pi(); % First assume all dung beetles go towards pi
Time_Total=zeros(num,1);
Path_Total=zeros(num,1);
x_partial = cos(Theta(1,1));  
y_partial = sin(Theta(1,1));
min_time=9999;
Timer = Check_Time/Delta_t;

for i = 1:num
    while (Distance(Position(Round,1,i), Position(Round,2,i)) < Radius)
        [Position(Round+1,1,i), Position(Round+1,2,i)] = Moving(Position(Round,1,i), Position(Round,2,i), Veloc, Delta_t, x_partial, y_partial);
        [Theta(Round+1,1),x_partial,y_partial] = Drifting(Theta(Round,1), Delta_t,Sigma); % Persist Drifting
%         [Theta(Round+1,1),x_partial,y_partial] = Unbiased_Drifting(); % Unbiased Drifting
%         [Theta(Round+1,1),x_partial,y_partial] = Bimodal_Drifting(Theta(Round,1),2*Sigma,Delta_t, Sigma); %Bimodal Drifting
        Round = Round + 1;
        Time_Total(i,1) = Time_Total(i,1) + Delta_t;
        Path_Total(i,1) = Path_Total(i,1) + Delta_t * Veloc;
        Timer = Timer - 1;
        if (mod((Round-1),(Check_Time/Delta_t))==0) % Check for every specific time interval
            [Theta(Round,1), x_partial, y_partial] = Adjust_Dir(Position(Round,1,i),Position(Round,2,i));
            Time_Total(i,1) = Time_Total(i,1) + Time_Pen;
            Timer = Check_Time/Delta_t;
        end
    end
    if (min_time>mean(Time_Total))
        min_time = mean(Time_Total);
        min_Time_Total = mean(Time_Total);
        min_Path_Total = mean(Path_Total);
        CI_T1 = mean(Time_Total)-1.96*sqrt(var(Time_Total)/num);
        CI_T2 = mean(Time_Total)+1.96*sqrt(var(Time_Total)/num);
        CI_L1 = mean(Path_Total)-1.96*sqrt(var(Path_Total)/num);
        CI_L2 = mean(Path_Total)+1.96*sqrt(var(Path_Total)/num);
        min_Int = Check_Time;
    end
    Round=1;
    x_partial = cos(Theta(Round,1));  
    y_partial = sin(Theta(Round,1));
end
end

