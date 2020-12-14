num = 2000;
Position = zeros(500,2,num); % Denote the position of dung beetles
Radius = 100;
Round = 1;
Veloc = 3.83; % Velocity
Delta_t = 1;
Sigma = pi()/12;
Theta = zeros(100000,1);
Theta(1,1) = 2*pi()*rand()-pi; % First assume all dung beetles go towards pi
Time_Total=zeros(num,1);
Path_Total=zeros(num,1);
 
x_partial = cos(Theta(1,1));  
y_partial = sin(Theta(1,1));
num_direction = 8;
p = zeros(num_direction,1);

for i = 1:num
    if mod(i,100)==0
        disp(i)
    end
    while (Distance(Position(Round,1,i), Position(Round,2,i)) < Radius)
        [Position(Round+1,1,i), Position(Round+1,2,i)] = Moving(Position(Round,1,i), Position(Round,2,i), Veloc, Delta_t, x_partial, y_partial);
        p = NORM_CDF_G(Theta(Round,1), Delta_t, Sigma, num_direction);

        Random_Num = rand();
        p_cum = cumsum(p);
        for j = 1:num_direction
            if Random_Num<p_cum(j,1)
                Theta(Round+1,1) = -pi+2*pi*(j-1)/num_direction;
                x_partial = cos(Theta(Round+1,1));
                y_partial = sin(Theta(Round+1,1));
                break;
            end
        end
%         [Theta(Round+1,1),x_partial,y_partial] = Drifting(Theta(Round,1), Delta_t,Sigma); % Persist Drifting
%         [Theta(Round+1,1),x_partial,y_partial] = Unbiased_Drifting(); % Unbiased Drifting
%         [Theta(Round+1,1),x_partial,y_partial] = Bimodal_Drifting(Theta(Round,1),2*Sigma,Delta_t, Sigma); %Bimodal Drifting
        Round = Round + 1;
        Time_Total(i,1) = Time_Total(i,1) + Delta_t;
        Path_Total(i,1) = Path_Total(i,1) + Delta_t * Veloc;
    end
if (i==1 || i==2 || i==3 || i==4 || i==5 || i==6)
    if (i==1)
        figure('name','Path');
    end
    grid on;
    set(gca,'XLim',[-1.2*Radius,1.2*Radius]);
    set(gca,'YLim',[-1.2*Radius,1.2*Radius]);
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
        x(k,1) = Position(k,1,i);
        y(k,1) = Position(k,2,i);
    end
    xlabel('x(cm)','FontSize',18)
    ylabel('y(cm)','FontSize',18)
    ax = gca;
    ax.FontSize = 18; 
    plot(x,y);
    hold on;
end
Round=1;
Theta(1,1)=2*pi()*rand()-pi();
x_partial = cos(Theta(Round,1));  
y_partial = sin(Theta(Round,1));

end

figure('Name','Histogram_Time');
histogram(Time_Total,60);
% xlim([0 50])
xlabel('Time (s)','FontSize',18);
ylabel('Number of Beetles','FontSize',18);
ax = gca;
ax.FontSize = 18; 

figure('Name','Histogram_Length');
histogram(Path_Total,60);
% xlim([0 150])
xlabel('Path Length (cm)','FontSize',18);
ylabel('Number of Beetles','FontSize',18);
ax = gca;
ax.FontSize = 18; 
disp(mean(Time_Total));
disp([mean(Time_Total)-1.96*sqrt(var(Time_Total)/num) mean(Time_Total)+...
    1.96*sqrt(var(Time_Total)/num)]);
disp(mean(Path_Total));
disp([mean(Path_Total)-1.96*sqrt(var(Path_Total)/num) mean(Path_Total)+...
    1.96*sqrt(var(Path_Total)/num)]);