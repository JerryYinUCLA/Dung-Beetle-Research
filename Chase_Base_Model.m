% Initialization of Dung Beetle
num = 5;
Position = zeros(1000,2,num); % Denote the position of dung beetles
Radius = 100;
Round = 1;
Veloc = 3.83; % Velocity
Delta_t = 0.1;
Sigma = pi()/6;
Theta = zeros(1000,1);
Theta(1,1) = pi(); % First assume all dung bee tles go towards pi
Time_Total=zeros(num,1);
Path_Total=zeros(num,1);
x_partial = cos(Theta(1,1));  
y_partial = sin(Theta(1,1));

% Initialization of the Chaser
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
    num_unchased = num_unchased + 1;
    initial_dist = R_c+(B_c-R_c)*rand();
%     initial_dist = 99;
    initial_angle = 2*pi()*rand();
    Position_c(1,1,i) = initial_dist*cos(initial_angle);
    Position_c(1,2,i) = initial_dist*sin(initial_angle);
    while (Distance(Position(Round,1,i), Position(Round,2,i)) < Radius)
        % Movement of Dung Beetle
        [Position(Round+1,1,i), Position(Round+1,2,i)] = Moving(Position(Round,1,i), Position(Round,2,i), Veloc, Delta_t, x_partial, y_partial);
        [Theta(Round+1,1),x_partial,y_partial] = Drifting(Theta(Round,1), Delta_t,Sigma); % Persist Drifting
        % Movement of Chaser
        if (mod(Round,10)==1 && Round>1)
            [Theta_c,x_partial_c,y_partial_c] = Diffusion();
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
        
        % Determine Chased or not
        x_diff = Position_c(Round,1,i)-Position(Round,1,i);
        y_diff = Position_c(Round,2,i)-Position(Round,2,i);
        if (Distance(x_diff,y_diff)<=R_c)
            num_unchased = num_unchased - 1;
            num_chased = num_chased + 1;
            break;
        end
    end
if true
    if true
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
    xc = zeros(Round-1,1);
    yc = zeros(Round-1,1);
    y = zeros(Round-1,1);
    for k = 1:(Round - 1);
        x(k,1) = Position(k,1,i);
        xc(k,1) = Position_c(k,1,i);
        y(k,1) = Position(k,2,i);
        yc(k,1) = Position_c(k,2,i);
    end
    xlabel('x(cm)','FontSize',18)
    ylabel('y(cm)','FontSize',18)
    ax = gca;
    ax.FontSize = 18; 
    d = plot(x,y,'LineWidth',2);
    hold on;
    c = plot(xc,yc,'r','LineWidth',2);
    hold on;
    legend([d c],{'Roller','Searcher'})
    hold on;
    diff = sqrt((x(Round-1,1)-xc(Round-1,1))^2+(y(Round-1,1)-yc(Round-1,1))^2);
    disp(diff);
    pos_s1 = [-2 -2 4 4];
    rectangle('Position',pos_s1,'Curvature',[1 1],'EdgeColor','k','FaceColor',[0 0 1]);
    pos_s2 = [xc(1,1)-2 yc(1,1)-2 4 4];
    rectangle('Position',pos_s2,'Curvature',[1 1],'EdgeColor','k','FaceColor',[1 0 0]);
    if diff <= R_c+0.5
        pos = [xc(Round-1,1)-R_c yc(Round-1,1)-R_c 2*R_c 2*R_c];
        pos_p = [xc(Round-1,1)-1 yc(Round-1,1)-1 2 2];
        rectangle('Position',pos,'Curvature',[1 1],'EdgeColor','k','FaceColor',[0 0 0 0.5])
        rectangle('Position',pos_p,'Curvature',[1 1],'EdgeColor','k','FaceColor',[0 0 0]);
        hold on;
    end
end
Round=1;
Theta(1,1)=2*pi()*rand()-pi();
x_partial = cos(Theta(Round,1));  
y_partial = sin(Theta(Round,1));

end

disp(mean(Time_Total));
disp([mean(Time_Total)-1.96*sqrt(var(Time_Total)/num) mean(Time_Total)+...
    1.96*sqrt(var(Time_Total)/num)]);
disp(mean(Path_Total));
disp([mean(Path_Total)-1.96*sqrt(var(Path_Total)/num) mean(Path_Total)+...
    1.96*sqrt(var(Path_Total)/num)]);
disp(num_chased/(num_chased+num_unchased));