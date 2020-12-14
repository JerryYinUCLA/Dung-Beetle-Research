% Initialization of Dung Beetle
num = 500;
Position = zeros(1000,2,num); % Denote the position of dung beetles
Radius = 100;
Round = 1;
Veloc = 3.83; % Velocity
Delta_t = 0.1;
Sigma = pi()/4;
Theta = zeros(1000,1);
Theta(1,1) = pi(); % First assume all dung bee tles go towards pi
Time_Total=zeros(num,1);
Path_Total=zeros(num,1);
x_partial = cos(Theta(1,1));  
y_partial = sin(Theta(1,1));

% Initialization of the Chaser
N_c = 10;
R_c = 5;
B_c = 100;
V_c = 5.00;
D_c = 20;
Position_c = zeros(1000,2,num,N_c);
Theta_c = zeros(1,N_c);
Theta_c(1,:) = pi();
x_partial_c = cos(Theta_c);  
y_partial_c = sin(Theta_c);

num_chased = 0;
num_unchased = 0;

for i = 1:num
    num_unchased = num_unchased + 1;
    for q = 1:N_c
        initial_dist = R_c+(B_c-R_c)*rand();
        initial_angle = 2*pi()*rand();
        Position_c(1,1,i,q) = initial_dist*cos(initial_angle);
        Position_c(1,2,i,q) = initial_dist*sin(initial_angle);
    end
    while (Distance(Position(Round,1,i), Position(Round,2,i)) < Radius)
        flag = false;
        % Movement of Dung Beetle
        [Position(Round+1,1,i), Position(Round+1,2,i)] = Moving(Position(Round,1,i), Position(Round,2,i), Veloc, Delta_t, x_partial, y_partial);
        [Theta(Round+1,1),x_partial,y_partial] = Drifting(Theta(Round,1), Delta_t,Sigma); % Persist Drifting
        % Movement of Chaser
        for q = 1:N_c
            if (mod(Round,10)==1 && Round>1)
                diff_x = Position(Round+1,1,i)-Position_c(Round,1,i,q);
                diff_y = Position(Round+1,2,i)-Position_c(Round,2,i,1);
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
        
        % Determine Chased or not
        for q = 1:N_c
            x_diff = Position_c(Round,1,i,q)-Position(Round,1,i);
            y_diff = Position_c(Round,2,i,q)-Position(Round,2,i);
            if (Distance(x_diff,y_diff)<=R_c)
                num_unchased = num_unchased - 1;
                num_chased = num_chased + 1;
                flag = true;
                break;
            end
        end
        if flag==true
            break;
        end
    end
% if (i==1)
%     if (i==1)
%         figure('name','Path');
%     end
%     grid on;
%     set(gca,'XLim',[-1.2*Radius,1.2*Radius]);
%     set(gca,'YLim',[-1.2*Radius,1.2*Radius]);
%     circle1=zeros(81,1);
%     circle2=zeros(81,1);
%     k = 1;
%     for j = 0:pi()/40:2*pi()
%         circle1(k,1) = Radius*cos(j);
%         circle2(k,1) = Radius*sin(j);
%         k = k+1;
%     end
%     plot(circle1,circle2,'c','linewidth',1);
%     axis('square')
%     hold on;
%     x = zeros(Round-1,1);
%     xc = zeros(Round-1,1);
%     yc = zeros(Round-1,1);
%     y = zeros(Round-1,1);
%     for k = 1:(Round - 1);
%         x(k,1) = Position(k,1,i);
%         xc(k,1) = Position_c(k,1,i);
%         y(k,1) = Position(k,2,i);
%         yc(k,1) = Position_c(k,2,i);
%     end
%     xlabel('x(cm)','FontSize',18)
%     ylabel('y(cm)','FontSize',18)
%     ax = gca;
%     ax.FontSize = 18; 
%     plot(x,y);
%     hold on;
%     plot(xc,yc,'*');
%     hold on;
% end
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