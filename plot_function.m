Radius = 200;
for i=1:1
    if (i==1)
        figure('name','Path');
    end
    grid on;
    set(gca,'XLim',[-225,225]);   
    set(gca,'YLim',[-225,225]);
    xlabel('x(cm)','FontSize',18)
    ylabel('y(cm)','FontSize',18)
    ax = gca;
    ax.FontSize = 18;
    circle1=zeros(81,1); 
    circle2=zeros(81,1);
    k = 1;
    for j = 0:pi()/40:2*pi()
        circle1(k,1) = Radius*cos(j);
        circle2(k,1) = Radius*sin(j);
        k = k+1;
    end
    plot(circle1,circle2,'c','linewidth',1,'color','b');
    hold on
    Radius = Radius/2;
    circle1=zeros(81,1); 
    circle2=zeros(81,1);
    k = 1;
    for j = 0:pi()/40:2*pi()
        circle1(k,1) = Radius*cos(j);
        circle2(k,1) = Radius*sin(j);
        k = k+1;
    end
    plot(circle1,circle2,'c','linewidth',1,'color','r');
    axis('square')
    hold on;
    num = 1;
    for j=2:size(Opt_Path,1)
        if (Opt_Path(j,1,i)~=0 || Opt_Path(j,2,i)~=0)
            num = num+1;
        else
            break;
        end
    end
    Plot_Path=zeros(num,2,6);
    for j=1:num
        Plot_Path(j,1,i)=Opt_Path(j,1,i);
        Plot_Path(j,2,i)=Opt_Path(j,2,i);
    end
    plot(Plot_Path(:,1,i),Plot_Path(:,2,i),'linewidth',1.5,'color','m');
    hold on;
    for j=1:size(Opt_Orien,1)
        if (Opt_Orien(j,i)~=0)
            scatter(Plot_Path(Opt_Orien(j,i),1,i),Plot_Path(Opt_Orien(j,i),2,i),'k');
        end
    end
    hold on;
%     new_path = zeros(size(Plot_Path,1),2);
%     new_path(:,1) = Plot_Path(:,1,1)+Plot_Path(end,1,1);
%     new_path(:,2) = Plot_Path(:,2,1)+Plot_Path(end,2,1);
% %     new_path(:,1) = new_path(:,2)*sin(-angle)+new_path(:,1)*cos(-angle);
% %     new_path(:,2) = new_path(:,2)*cos(-angle)-new_path(:,1)*sin(-angle);
    Radius = 100;
    circle1=zeros(81,1); 
    circle2=zeros(81,1);
    k = 1;
    critical = find(sqrt(Plot_Path(:,1,1).^2+Plot_Path(:,2,1).^2)>100,1);
    
    for j = 0:pi()/40:2*pi()
        circle1(k,1) = Radius*cos(j)+ Plot_Path(critical,1,1);
        circle2(k,1) = Radius*sin(j)+ Plot_Path(critical,2,1);
        k = k+1;
    end
    plot(circle1,circle2,'c','linewidth',1,'color','k');
    xlabel('x(cm)','FontSize',18);
    ylabel('y(cm)','FontSize',18);
    ax=gca;
    ax.FontSize=18;
    set(gca,'XLim',[-225,225]);   
    set(gca,'YLim',[-225,225]);
    grid on
%     hold on
%     plot(new_path(:,1),new_path(:,2));
end
figure('Name','Histogram_Time');
histogram(Opt_Time_Total,20);
xlabel('Time (s)','FontSize',18);
ylabel('Number of Beetles','FontSize',18);
ax = gca;
ax.FontSize = 18;
figure('Name','Histogram_Length');
histogram(Opt_Path_Total,20);
xlabel('Path Length (cm)','FontSize',18);
ylabel('Number of Beetles','FontSize',18);
ax = gca;
ax.FontSize = 18;