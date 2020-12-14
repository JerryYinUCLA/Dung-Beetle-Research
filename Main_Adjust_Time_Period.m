num = 500;
Position = zeros(1000,2,num); % Denote the position of dung beetles
Radius = 100;
Round = 1;
Veloc = 3.83; % Velocity
Delta_t = 0.1;
Time_Pen = 5.0; % Time to adjust direction
Check_Time = 4.8; % Time to check direction
Sigma = pi()/4;
Theta = zeros(1000,1);
Theta(1,1) = pi(); % First assume all dung beetles go towards pi
Time_Total=zeros(num,1);
Path_Total=zeros(num,1);
Check_num=0;

x_partial = cos(Theta(1,1));  
y_partial = sin(Theta(1,1));

for i = 1:num
    Check_num=0;
    while (Distance(Position(Round,1,i), Position(Round,2,i)) < Radius)
        [Position(Round+1,1,i), Position(Round+1,2,i)] = Moving(Position(Round,1,i), Position(Round,2,i), Veloc, Delta_t, x_partial, y_partial);
        [Theta(Round+1,1),x_partial,y_partial] = Drifting(Theta(Round,1), Delta_t,Sigma); % Persist Drifting
%         [Theta(Round+1,1),x_partial,y_partial] = Unbiased_Drifting(); % Unbiased Drifting
%         [Theta(Round+1,1),x_partial,y_partial] = Bimodal_Drifting(Theta(Round,1),2*Sigma,Delta_t, Sigma); %Bimodal Drifting
        Round = Round + 1;
        Time_Total(i,1) = Time_Total(i,1) + Delta_t;
        Path_Total(i,1) = Path_Total(i,1) + Delta_t * Veloc;
        if (mod((Round-1),(Check_Time/Delta_t))==0) % Check for every specific time interval
            [Theta(Round,1), x_partial, y_partial] = Adjust_Dir(Position(Round,1,i),Position(Round,2,i));
            Time_Total(i,1) = Time_Total(i,1) + Time_Pen;
            Check_num=Check_num+1;
        end
    end
if (i==1)
    figure('name','Path');
    grid on;
    set(gca,'XLim',[-121,121]);
    set(gca,'YLim',[-121,121]);
    circle1=zeros(81,1);
    circle2=zeros(81,1);
    k = 1;
    for j = 0:pi()/40:2*pi()
        circle1(k,1) = Radius*cos(j);
        circle2(k,1) = Radius*sin(j);
        k = k+1;
    end
    plot(circle1,circle2,'c','linewidth',1);
    axis('square')
    hold on;
    x = zeros(Round-1,1);
    y = zeros(Round-1,1);
    for k = 1:(Round - 1);
        x(k,1) = Position(k,1,1);
        y(k,1) = Position(k,2,1);
    end
    plot(x,y);
    saveas(gcf,['Bimodal_Pen_',num2str(fix(Time_Pen)),'_',num2str(mod(Time_Pen*10,10)),'_Check_',num2str(fix(Check_Time)),'_',num2str(mod(Check_Time*10,10)),'_PathEg'],'jpg');
end
Round=1;
x_partial = cos(Theta(Round,1));  
y_partial = sin(Theta(Round,1));
end


figure('Name','Histogram_Time');
histogram(Time_Total,20);
% saveas(gcf,['Bimodal_Pen_',num2str(fix(Time_Pen)),'_',num2str(mod(Time_Pen*10,10)),'_Check_',num2str(fix(Check_Time)),'_',num2str(mod(Check_Time*10,10)),'_Time'],'jpg');

figure('Name','Histogram_Length');
histogram(Path_Total,20);
% saveas(gcf,['Bimodal_Pen_',num2str(fix(Time_Pen)),'_',num2str(mod(Time_Pen*10,10)),'_Check_',num2str(fix(Check_Time)),'_',num2str(mod(Check_Time*10,10)),'_Length'],'jpg');

Mean_T = mean(Time_Total);
Mean_L = mean(Path_Total);
CI_T1 = mean(Time_Total)-1.96*sqrt(var(Time_Total)/num);
CI_T2 = mean(Time_Total)+1.96*sqrt(var(Time_Total)/num);
CI_L1 = mean(Path_Total)-1.96*sqrt(var(Path_Total)/num);
CI_L2 = mean(Path_Total)+1.96*sqrt(var(Path_Total)/num);
Trial_Num = Write_To_Excel_1(Trial_Num,'Bimodal',Radius,Veloc,Delta_t,Sigma,num,Time_Pen,Check_Time,Mean_T,Mean_L,CI_T1,CI_T2,CI_L1,CI_L2);
