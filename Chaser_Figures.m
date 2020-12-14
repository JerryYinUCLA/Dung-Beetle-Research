% Capture_Prob = [0.474,0.474
%                 0.335,0.355
%                 0.301,0.322];
% figure()
% bar(Capture_Prob)
% xlabel('Reorientation Method','FontSize',16)
% ylabel('Capture Probability (%)','FontSize',16)
% ax = gca;
% ax.FontSize = 16;
% set(gca,'xticklabel',{'Drifting','Periodic','Error Threshold'});
% set(gca,'YLim',[0,1]);
% title(['Minimum Capture Probability' 'under Different Strategies']);
% legend('Experimental Data','Theoretical')
% text(0.8,Capture_Prob(1,1)+0.05,[num2str(100*Capture_Prob(1,1)) '%'])
% text(1.1,Capture_Prob(1,2)+0.05,[num2str(100*Capture_Prob(1,2)) '%'])
% text(1.8,Capture_Prob(2,1)+0.05,[num2str(100*Capture_Prob(2,1)) '%'])
% text(2.1,Capture_Prob(2,2)+0.05,[num2str(100*Capture_Prob(2,2)) '%'])
% text(2.8,Capture_Prob(3,1)+0.05,[num2str(100*Capture_Prob(3,1)) '%'])
% text(3.1,Capture_Prob(3,2)+0.05,[num2str(100*Capture_Prob(3,2)) '%'])
% 
% MFPT = [127.7
%        83.76
%        55.9];
% figure
% bar(MFPT,0.2)
% xlabel('Reorientation Method','FontSize',16)
% ylabel('MFPT (s)','FontSize',16)
% ax = gca;
% ax.FontSize = 16;
% set(gca,'xticklabel',{'Drifting','Periodic','Error Threshold'});
% % set(gca,'YLim',[0,1]);
% title(['Minimum Mean First Passage Time' 'under Different Strategies']);
% text(0.95,MFPT(1,1)+5,num2str(MFPT(1,1)))
% text(1.95,MFPT(2,1)+5,num2str(MFPT(2,1)))
% text(2.95,MFPT(3,1)+5,num2str(MFPT(3,1)))
%
% figure
% pos1 = [-100 -100 200 200];
% pos2 = [-75 -75 150 150];
% pos3 = [-50 -50 100 100];
% pos4 = [-25 -25 50 50];
% rectangle('Position',pos1,'Curvature',[1 1],'FaceColor',[1 0 0],'LineWidth',3)
% rectangle('Position',pos2,'Curvature',[1 1],'FaceColor',[1 0.2 0],'LineWidth',3)
% rectangle('Position',pos3,'Curvature',[1 1],'FaceColor',[1 0.4 0],'LineWidth',3)
% rectangle('Position',pos4,'Curvature',[1 1],'FaceColor',[1 0.6 0],'LineWidth',3)
% colorbar
% axis equal
% 
% figure
% for i = 1:1000
%     r = -100+0.1*(i-1)-0.001;
%     pos = [r r -r*2 -r*2];
%     co = [1 (i-1)*0.001 0];
%     rectangle('Position',pos,'Curvature',[1 1],'FaceColor',co,'EdgeColor',co,'LineWidth',1)
% end
% colorbar
% axis equal
% 
% Sigma = [0.104719755,0.157079633,0.20943951,0.261799388,0.314159265,0.366519143,0.41887902,0.471238898,...
%     0.523598776,0.575958653,0.628318531,0.680678408,0.733038286,0.785398163,0.837758041,0.890117919,...
%     0.942477796,0.994837674,1.047197551,1.099557429,1.151917306,1.204277184,1.256637061,...
%     1.308996939,1.361356817,1.413716694,1.466076572,1.518436449,1.570796327];
% MFPT1 = [9,10.8,5.4,11.4,11.2,10.8,5.8,3.4,7.2,9.8,4.8,3.2,6.4,6,5.4,6.2,2,5.2,...
%     5.8,2,2.8,1.8,3.2,1.6,3.6,3.2,2.2,4.4,2];
% figure
% plot(Sigma,MFPT1,'bo');
% xlabel('Drifting Tendency \sigma_d','FontSize',18);
% ylabel('Optimal Reorientation Period T^* (s)','FontSize',18);
% ax = gca;
% ax.FontSize = 18;
% set(gca,'XLim',[0,1.7])
% axis('square')

% Sigma = [0.104719755,0.157079633,0.20943951,0.261799388,0.314159265,0.366519143,0.41887902,0.471238898,...
%     0.523598776,0.575958653,0.628318531,0.680678408,0.733038286,0.785398163,0.837758041,0.890117919,...
%     0.942477796,0.994837674,1.047197551,1.099557429,1.151917306,1.204277184,1.256637061,...
%     1.308996939,1.361356817,1.413716694,1.466076572,1.518436449,1.570796327];
% MFPT2 = [2.548180708,1.256637061,0.872664626,1.012290966,2.862339973,0.837758041,1.256637061,1.396263402,...
%     1.082104136,1.012290966,1.884955592,1.186823891,1.989675347,1.326450232,1.431169987,...
%     1.256637061,1.710422667,1.850049007,1.640609497,2.303834613,1.500983157,2.129301687,...
%     2.129301687,2.303834613,1.710422667,2.303834613,2.059488517,1.989675347,2.862339973];
% figure
% plot(Sigma,MFPT2,'bo');
% xlabel('Drifting Tendency \sigma_d','FontSize',18);
% ylabel('Optimal Error Threshold \theta_e^*','FontSize',18);
% ax = gca;
% ax.FontSize = 18;
% set(gca,'XLim',[0,1.7])
% axis('square')

% Figure 19
% y1 = [82.80 66.20 54.00 47.40 41.60 40.80 42.60 36.60 38.00 36.20];
% y2 = [75.20 52.64 39.20 32.20 27.20 22.00 19.20 17.20 17.20 14.20];
% y3 = [74.60 49.00 36.00 27.80 22.20 20.20 18.80 15.00 14.60 13.20];
% 
% x = [25 50 75 100 125 150 175 200 225 250];
% figure
% h1 = plot(x,y1,'ro-','MarkerSize',6,'LineWidth',2);
% hold on
% h2 = plot(x,y2,'bs--','MarkerSize',6,'LineWidth',2);
% hold on
% h3 = plot(x,y3,'gx:','MarkerSize',6,'LineWidth',2);
% hold on
% ax = gca;
% ax.FontSize = 16;
% set(gca,'YLim',[0,100]);
% set(gca,'XLim',[0,275]);
% title('Escaping Searches for Various Radii','FontSize',20);
% xlabel('Arena Radius (cm)','FontSize',16)
% ylabel('Percentage Captured','FontSize',16)
% legend([h1 h2 h3],'Basic Drifting','Periodic Reorientation','Error Threshold Reorientation')

% Figure 20
% y1 = [26.6,26.8,28.0,32.0,31.0,32.8,35.4,36.4,45.6,43.0,46.8,42.6,...
%     50.2,50.0,50.6,52.0,49.4,51.6,55.2,56.6,53.6,57.6,58.4,55.2,...
%     60.2,56.0,60.8,60.8,64.0,62.0];
% y2 = [23.4,23.4,24.0,25.8,26.0,25.0,28.0,27.2,26.4,28.8,28.4,29.4,...
%     29.0,30.0,30.6,32.6,33.0,32.8,32.6,35.0,35.8,33.4,36.0,35.6,...
%     38.4,38.2,37.2,37.8,39.4,41.8];
% y3 = [22.4,23.6,24.4,24.6,25.0,25.8,26.4,26.2,27.8,27.6,27.2,27.6,...
%     28.0,27.8,27.6,27.6,28.2,30.4,29.4,30.2,28.6,32.6,31.4,31.4,...
%     30.8,32.6,32.4,34.4,32.4,34.6];
% 
% x = [0.104719755,0.157079633,0.20943951,0.261799388,0.314159265,...
%     0.366519143,0.41887902,0.471238898,0.523598776,0.575958653,...
%     0.628318531,0.680678408,0.733038286,0.785398163,0.837758041,...
%     0.890117919,0.942477796,0.994837674,1.047197551,1.099557429,...
%     1.151917306,1.204277184,1.256637061,1.308996939,1.361356817,...
%     1.413716694,1.466076572,1.518436449,1.570796327,1.623156204];
% figure
% h1 = plot(x,y1,'mo-','MarkerSize',6,'LineWidth',2);
% hold on
% h2 = plot(x,y2,'bs--','MarkerSize',6,'LineWidth',2);
% hold on
% h3 = plot(x,y3,'gx:','MarkerSize',6,'LineWidth',2);
% hold on
% ax = gca;
% ax.FontSize = 16;
% set(gca,'YLim',[0,100]);
% set(gca,'XLim',[0,1.7]);
% title('Escaping Searches for Various Drifting Tendencies','FontSize',20);
% xlabel('Drifting Tencency \sigma_d','FontSize',16)
% ylabel('Percentage Captured','FontSize',16)
% legend([h1 h2 h3],'Basic Drifting','Periodic Reorientation','Error Threshold Reorientation')

% Periodic Noise
% y_clean = [23.4,23.4,24.0,25.8,26.0,25.0,28.0,27.2,26.4,28.8,28.4,29.4,...
%            29.0,30.0,30.6,32.6,33.0,32.8,32.6,35.0,35.8,33.4,36.0,35.6,...
%            38.4,38.2,37.2,37.8,39.4,41.8];
% y_noise = [25.4,25.2,24.6,21.8,25.6,25.0,25.8,28.2,28.6,28.2,29.2,30.4,...
%            30.2,32.0,29.4,33.6,32.6,33.4,33.4,34.0,34.0,36.4,37.0,36.0,...
%            37.2,37.8,38.2,40.2,40.0,39.8];
% x = [0.104719755,0.157079633,0.20943951,0.261799388,0.314159265,...
%     0.366519143,0.41887902,0.471238898,0.523598776,0.575958653,...
%     0.628318531,0.680678408,0.733038286,0.785398163,0.837758041,...
%     0.890117919,0.942477796,0.994837674,1.047197551,1.099557429,...
%     1.151917306,1.204277184,1.256637061,1.308996939,1.361356817,...
%     1.413716694,1.466076572,1.518436449,1.570796327,1.623156204];
% figure
% h1 = plot(x,y_clean,'mo-','MarkerSize',4,'LineWidth',1.5);
% hold on
% h2 = plot(x,y_noise,'bd--','MarkerSize',4,'LineWidth',1.5);
% hold on
% ax = gca;
% ax.FontSize = 18;
% set(gca,'YLim',[20,50]);
% set(gca,'XLim',[0,1.7]);
% % title(['Minimum Capture Probability under Different Drifting Coefficients with Exact and Noisy Periodic Reorientation']);
% xlabel('Drifting Tendency \sigma_d','FontSize',18)
% ylabel('Percentage Captured','FontSize',18)
% legend([h1 h2],'Exact Periodic Reorientation','Noisy Periodic Reorientation')

% Error Threshold Noise
% y_clean = [22.4,23.6,24.4,24.6,25.0,25.8,26.4,26.2,27.8,27.6,27.2,27.6,...
%         28.0,27.8,27.6,27.6,28.2,30.4,29.4,30.2,28.6,32.6,31.4,31.4,...
%         30.8,32.6,32.4,34.4,32.4,34.6];
% y_noise = [24.2,24.0,23.6,24.8,25.8,25.8,26.2,25.4,26.0,27.2,28.4,28.2,...
%         28.4,28.2,29.0,28.6,28.6,29.8,30.8,29.8,31.4,30.6,30.6,31.2,31.0,...
%         31.4,34.2,32.2,33.4,33.2];
% x = [0.104719755,0.157079633,0.20943951,0.261799388,0.314159265,...
%     0.366519143,0.41887902,0.471238898,0.523598776,0.575958653,...
%     0.628318531,0.680678408,0.733038286,0.785398163,0.837758041,...
%     0.890117919,0.942477796,0.994837674,1.047197551,1.099557429,...
%     1.151917306,1.204277184,1.256637061,1.308996939,1.361356817,...
%     1.413716694,1.466076572,1.518436449,1.570796327,1.623156204];
% figure
% h1 = plot(x,y_clean,'mo-','MarkerSize',4,'LineWidth',1.5);
% hold on
% h2 = plot(x,y_noise,'bd--','MarkerSize',4,'LineWidth',1.5);
% hold on
% ax = gca;
% ax.FontSize = 18;
% set(gca,'YLim',[20,50]);
% set(gca,'XLim',[0,1.7]);
% % title('Minimum Capture Probability under Different Drifting Coefficients with Exact and Noisy Error Threshold Reorientation');
% xlabel('Drifting Tendency \sigma_d','FontSize',18)
% ylabel('Percentage Captured','FontSize',18)
% legend([h1 h2],'Exact Error Threshold Reorientation','Noisy Error Threshold Reorientation')

% Periodic Noise vs Capture Prob
% T_error = [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
% Capture_Prob = [31.6 33.0 32.0 32.4 31.4 31.8 30.4 31.2 31.0 31.4 30.6];
% figure
% bar(T_error,Capture_Prob,0.6);
% ax = gca;
% ax.FontSize = 18;
% set(gca,'YLim',[0,50]);
% set(gca,'XLim',[-0.1,1.1]);
% % title('Minimum Capture Probability under Different Detection Error with Periodic Reorientation');
% xlabel('Detection Error \sigma_{dt}','FontSize',18)
% ylabel('Percentage Captured','FontSize',18)
% for i = 1:size(Capture_Prob,2)
%     text(0.1*(i-1)-0.025,Capture_Prob(1,i)+2,num2str(Capture_Prob(1,i),'%.1f'),'FontSize',16);
% end

% Error Threshold Noise vs Capture Prob
% E_error = [0 0.034906585 0.06981317 0.104719755 0.13962634 0.174532925 0.20943951 ...
%     0.244346095 0.27925268 0.314159265 0.34906585];
% Capture_Prob = [27.2 27.0 27.4 28.4 27.8 29.0 28.0 27.2 28.6 27.2 27.4];
% figure
% bar(E_error,Capture_Prob,0.6);
% ax = gca;
% ax.FontSize = 18;
% set(gca,'YLim',[0,50]);
% set(gca,'XLim',[-0.03,0.38]);
% % title('Minimum Capture Probability under Different Detection Error with Error Threshold Reorientation');
% xlabel('Detection Error \sigma_{de}','FontSize',18)
% ylabel('Percentage Captured','FontSize',18)
% ax.XTick = [0 2*pi/90 4*pi/90 6*pi/90 8*pi/90 10*pi/90];
% ax.XTickLabel = {'0','2\pi/90','4\pi/90','6\pi/90','8\pi/90','10\pi/90'};
% % set(gca,'xticks',{0 2*pi/90 4*pi/90 6*pi/90 8*pi/90 10*pi/90})
% % set(gca,'xticklabels',{'0','2\pi/90','4\pi/90','6\pi/90','8\pi/90','10\pi/90'})
% for i = 1:size(Capture_Prob,2)
%     text((i-1)*pi/90-0.008,Capture_Prob(1,i)+2,num2str(Capture_Prob(1,i),'%.1f'),'FontSize',16);
% end

% Various Searchers
% y1 = [49.80 61.60 67.00 71.40 76.80 78.60 84.20 89.60 87.80 92.80 94.60 94.00];
% y2 = [30.20 53.20 68.80 78.40 86.40 90.80 92.60 94.80 97.00 97.60 98.80 99.40];
% y3 = [29.20 51.20 65.20 74.80 83.20 86.80 91.00 94.00 95.00 96.00 97.60 99.20];
% 
% x = [1 2 3 4 5 6 7 8 9 10 12 15];
% figure
% h1 = plot(x,y1,'mo-','MarkerSize',6,'LineWidth',1.5);
% hold on
% h2 = plot(x,y2,'bs--','MarkerSize',6,'LineWidth',1.5);
% hold on
% h3 = plot(x,y3,'gx:','MarkerSize',6,'LineWidth',1.5);
% hold on
% ax = gca;
% ax.FontSize = 16;
% set(gca,'YLim',[0,100]);
% set(gca,'XLim',[0,16]);
% title('Escaping Searches for Various Number of Searchers','FontSize',20);
% xlabel('Number of Searchers','FontSize',16)
% ylabel('Percentage Captured','FontSize',16)
% legend([h1 h2 h3],'Basic Drifting','Periodic Reorientation','Error Threshold Reorientation','Location','SouthEast')

% Detection Radius
% y1 = [20.20 31.00 42.80 51.80 56.60 61.00 66.20 70.20 75.00 77.40];
% y2 = [9.00 15.80 24.20 29.80 37.80 43.80 49.00 53.20 60.60 63.20];
% y3 = [7.40 13.60 20.80 27.80 34.20 40.80 46.40 52.00 57.20 62.00];
% 
% x = [5 10 15 20 25 30 35 40 45 50];
% figure
% h1 = plot(x,y1,'mo-','MarkerSize',6,'LineWidth',1.5);
% hold on
% h2 = plot(x,y2,'bs--','MarkerSize',6,'LineWidth',1.5);
% hold on
% h3 = plot(x,y3,'gx:','MarkerSize',6,'LineWidth',1.5);
% hold on
% ax = gca;
% ax.FontSize = 16;
% set(gca,'YLim',[0,100]);
% set(gca,'XLim',[0,52]);
% title('Escaping Searches for Various Detection Radii','FontSize',20);
% xlabel('Detection Radius D_s','FontSize',16)
% ylabel('Percentage Captured','FontSize',16)
% legend([h1 h2 h3],'Basic Drifting','Periodic Reorientation','Error Threshold Reorientation','Location','NorthWest')