X = [0.1, 0.2, 0.3, 0.4, 0.5, 1.0];
MFPT_P1 = [54.45,55.11,54.24,54.56,54.47,54.88];
MFPT_P2 = [83.64,84.72,83.95,83.72,84.23,83.95];
MFPT_P3 = [120.19,118.39,120.23,120.49,120.58,119.88];
figure()
plot(X,MFPT_P1,'-ro','MarkerFaceColor','r','LineWidth',1);
hold on
plot(X,MFPT_P2,'-go','MarkerFaceColor','g','LineWidth',1);
hold on
plot(X,MFPT_P3,'-bo','MarkerFaceColor','b','LineWidth',1);
hold on
ax = gca;
set(gca,'XLim',[0,1.25])
xlabel('Standard Deviation of Detection Error $$\sigma_{dt}$$ (s)','FontSize',16,'Interpreter','Latex')
ylabel('MFPT (s)','FontSize',16)
title('MFPT vs Standard Deviation of Detection Error in Periodic Reorientation','FontSize',18)
lgd = legend('\sigma_d = 10\pi/60', '\sigma_d = 15\pi/60','\sigma_d = 20\pi/60','Location','NorthEast');
lgd.FontSize = 16;
text(0.075,MFPT_P1(1,1)+3,num2str(MFPT_P1(1,1)),'FontSize',12)
text(0.175,MFPT_P1(1,2)+3,num2str(MFPT_P1(1,2)),'FontSize',12)
text(0.275,MFPT_P1(1,3)+3,num2str(MFPT_P1(1,3)),'FontSize',12)
text(0.375,MFPT_P1(1,4)+3,num2str(MFPT_P1(1,4)),'FontSize',12)
text(0.475,MFPT_P1(1,5)+3,num2str(MFPT_P1(1,5)),'FontSize',12)
text(0.975,MFPT_P1(1,6)+3,num2str(MFPT_P1(1,6)),'FontSize',12)
text(0.075,MFPT_P2(1,1)+3,num2str(MFPT_P2(1,1)),'FontSize',12)
text(0.175,MFPT_P2(1,2)+3,num2str(MFPT_P2(1,2)),'FontSize',12)
text(0.275,MFPT_P2(1,3)+3,num2str(MFPT_P2(1,3)),'FontSize',12)
text(0.375,MFPT_P2(1,4)+3,num2str(MFPT_P2(1,4)),'FontSize',12)
text(0.475,MFPT_P2(1,5)+3,num2str(MFPT_P2(1,5)),'FontSize',12)
text(0.975,MFPT_P2(1,6)+3,num2str(MFPT_P2(1,6)),'FontSize',12)
text(0.075,MFPT_P3(1,1)+3,num2str(MFPT_P3(1,1)),'FontSize',12)
text(0.175,MFPT_P3(1,2)+3,num2str(MFPT_P3(1,2)),'FontSize',12)
text(0.275,MFPT_P3(1,3)+3,num2str(MFPT_P3(1,3)),'FontSize',12)
text(0.375,MFPT_P3(1,4)+3,num2str(MFPT_P3(1,4)),'FontSize',12)
text(0.475,MFPT_P3(1,5)+3,num2str(MFPT_P3(1,5)),'FontSize',12)
text(0.975,MFPT_P3(1,6)+3,num2str(MFPT_P3(1,6)),'FontSize',12)



MFPT_P1 = [41.69,41.67,41.62,41.84,41.86,41.90,41.68,42.13,42.54,42.37];
MFPT_P2 = [55.87,55.88,56.02,55.42,56.42,55.59,56.20,56.46,56.64,57.02];
MFPT_P3 = [73.45,72.75,73.04,73.11,73.23,73.47,73.90,74.60,74.30,75.07];
figure()
plot(MFPT_P1,'-ro','MarkerFaceColor','r','LineWidth',1);
hold on
plot(MFPT_P2,'-go','MarkerFaceColor','g','LineWidth',1);
hold on
plot(MFPT_P3,'-bo','MarkerFaceColor','b','LineWidth',1);
hold on
ax = gca;
set(gca,'XLim',[0.5,10.5])
set(gca,'YLim',[30,95])
set(gca,'xticklabel',{'\pi/90','2\pi/90','3\pi/90','4\pi/90','5\pi/90','6\pi/90','7\pi/90','8\pi/90','9\pi/90','10\pi/90'});
xlabel('Standard Deviation of Detection Error $$\sigma_{de}$$ (rad)','FontSize',16,'Interpreter','Latex')
ylabel('MFPT (s)','FontSize',16)
title('MFPT vs Standard Deviation of Detection Error in Error Threshold Reorientation','FontSize',18)
lgd = legend('\sigma_d = 10\pi/60', '\sigma_d = 15\pi/60','\sigma_d = 20\pi/60','Location','NorthEast');
lgd.FontSize = 16;
text(0.8,MFPT_P1(1,1)+3,num2str(MFPT_P1(1,1)),'FontSize',12)
text(1.8,MFPT_P1(1,2)+3,num2str(MFPT_P1(1,2)),'FontSize',12)
text(2.8,MFPT_P1(1,3)+3,num2str(MFPT_P1(1,3)),'FontSize',12)
text(3.8,MFPT_P1(1,4)+3,num2str(MFPT_P1(1,4)),'FontSize',12)
text(4.8,MFPT_P1(1,5)+3,num2str(MFPT_P1(1,5)),'FontSize',12)
text(5.8,MFPT_P1(1,6)+3,num2str(MFPT_P1(1,6)),'FontSize',12)
text(6.8,MFPT_P1(1,7)+3,num2str(MFPT_P1(1,7)),'FontSize',12)
text(7.8,MFPT_P1(1,8)+3,num2str(MFPT_P1(1,8)),'FontSize',12)
text(8.8,MFPT_P1(1,9)+3,num2str(MFPT_P1(1,9)),'FontSize',12)
text(9.8,MFPT_P1(1,10)+3,num2str(MFPT_P1(1,10)),'FontSize',12)
text(0.8,MFPT_P2(1,1)+3,num2str(MFPT_P2(1,1)),'FontSize',12)
text(1.8,MFPT_P2(1,2)+3,num2str(MFPT_P2(1,2)),'FontSize',12)
text(2.8,MFPT_P2(1,3)+3,num2str(MFPT_P2(1,3)),'FontSize',12)
text(3.8,MFPT_P2(1,4)+3,num2str(MFPT_P2(1,4)),'FontSize',12)
text(4.8,MFPT_P2(1,5)+3,num2str(MFPT_P2(1,5)),'FontSize',12)
text(5.8,MFPT_P2(1,6)+3,num2str(MFPT_P2(1,6)),'FontSize',12)
text(6.8,MFPT_P2(1,7)+3,num2str(MFPT_P2(1,7)),'FontSize',12)
text(7.8,MFPT_P2(1,8)+3,num2str(MFPT_P2(1,8)),'FontSize',12)
text(8.8,MFPT_P2(1,9)+3,num2str(MFPT_P2(1,9)),'FontSize',12)
text(9.8,MFPT_P2(1,10)+3,num2str(MFPT_P2(1,10)),'FontSize',12)
text(0.8,MFPT_P3(1,1)+3,num2str(MFPT_P3(1,1)),'FontSize',12)
text(1.8,MFPT_P3(1,2)+3,num2str(MFPT_P3(1,2)),'FontSize',12)
text(2.8,MFPT_P3(1,3)+3,num2str(MFPT_P3(1,3)),'FontSize',12)
text(3.8,MFPT_P3(1,4)+3,num2str(MFPT_P3(1,4)),'FontSize',12)
text(4.8,MFPT_P3(1,5)+3,num2str(MFPT_P3(1,5)),'FontSize',12)
text(5.8,MFPT_P3(1,6)+3,num2str(MFPT_P3(1,6)),'FontSize',12)
text(6.8,MFPT_P3(1,7)+3,num2str(MFPT_P3(1,7)),'FontSize',12)
text(7.8,MFPT_P3(1,8)+3,num2str(MFPT_P3(1,8)),'FontSize',12)
text(8.8,MFPT_P3(1,9)+3,num2str(MFPT_P3(1,9)),'FontSize',12)
text(9.8,MFPT_P3(1,10)+3,num2str(MFPT_P3(1,10)),'FontSize',12)