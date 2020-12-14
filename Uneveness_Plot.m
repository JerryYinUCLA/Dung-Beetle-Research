MFPT = [84.95,83.46
        85.79,82.88
        87.27,82.27
        89.06,81.95
        90.03,80.65];
figure()
bar(MFPT)
xlabel('Deviation of Unevenness','FontSize',20)
ylabel('MFPT','FontSize',20)
ax = gca;
ax.FontSize = 20;
set(gca,'xticklabel',{'\pi/60','2\pi/60','3\pi/60','4\pi/60','5\pi/60'});
set(gca,'YLim',[0,120]);
title('MFPT of Different Deviation of Linear Unevenness (Periodic Reorientation)');
legend('Rougher Outside','Rougher Inside','Location','NorthWest')
text(0.7,MFPT(1,1)+8,num2str(MFPT(1,1)),'FontSize',20)
text(1.0,MFPT(1,2)+5,num2str(MFPT(1,2)),'FontSize',20)
text(1.7,MFPT(2,1)+7,num2str(MFPT(2,1)),'FontSize',20)
text(2.0,MFPT(2,2)+5,num2str(MFPT(2,2)),'FontSize',20)
text(2.7,MFPT(3,1)+6,num2str(MFPT(3,1)),'FontSize',20)
text(3.0,MFPT(3,2)+5,num2str(MFPT(3,2)),'FontSize',20)
text(3.7,MFPT(4,1)+6,num2str(MFPT(4,1)),'FontSize',20)
text(4.0,MFPT(4,2)+5,num2str(MFPT(4,2)),'FontSize',20)
text(4.7,MFPT(5,1)+6,num2str(MFPT(5,1)),'FontSize',20)
text(5.0,MFPT(5,2)+5,num2str(MFPT(5,2)),'FontSize',20)

MFPT = [82.73,85.75
        81.44,87.08
        81.18,89.31
        79.95,91.64
        79.32,93.73];
figure()
bar(MFPT)
xlabel('Deviation of Unevenness','FontSize',20)
ylabel('MFPT','FontSize',20)
ax = gca;
ax.FontSize = 20;
set(gca,'xticklabel',{'\pi/60','2\pi/60','3\pi/60','4\pi/60','5\pi/60'});
set(gca,'YLim',[0,120]);
title('MFPT of Different Deviation of Quadratic Unevenness (Periodic Reorientation)');
legend('Rougher Outside','Rougher Inside','Location','NorthWest')
text(0.7,MFPT(1,1)+5,num2str(MFPT(1,1)),'FontSize',20)
text(1.0,MFPT(1,2)+8,num2str(MFPT(1,2)),'FontSize',20)
text(1.7,MFPT(2,1)+5,num2str(MFPT(2,1)),'FontSize',20)
text(2.0,MFPT(2,2)+6,num2str(MFPT(2,2)),'FontSize',20)
text(2.7,MFPT(3,1)+5,num2str(MFPT(3,1)),'FontSize',20)
text(3.0,MFPT(3,2)+5,num2str(MFPT(3,2)),'FontSize',20)
text(3.7,MFPT(4,1)+5,num2str(MFPT(4,1)),'FontSize',20)
text(4.0,MFPT(4,2)+5,num2str(MFPT(4,2)),'FontSize',20)
text(4.7,MFPT(5,1)+5,num2str(MFPT(5,1)),'FontSize',20)
text(5.0,MFPT(5,2)+5,num2str(MFPT(5,2)),'FontSize',20)

MFPT = [55.79,55.72
        56.42,55.64
        56.38,55.47
        56.55,55.17
        56.95,55.24];
figure()
bar(MFPT)
xlabel('Deviation of Unevenness','FontSize',20)
ylabel('MFPT','FontSize',20)
ax = gca;
ax.FontSize = 20;
set(gca,'xticklabel',{'\pi/60','2\pi/60','3\pi/60','4\pi/60','5\pi/60'});
set(gca,'YLim',[0,100]);
title('MFPT of Different Deviation of Linear Unevenness (Error Threshold Reorientation)');
legend('Rougher Outside','Rougher Inside','Location','NorthWest')
text(0.7,MFPT(1,1)+6,num2str(MFPT(1,1)),'FontSize',20)
text(1.0,MFPT(1,2)+3,num2str(MFPT(1,2)),'FontSize',20)
text(1.7,MFPT(2,1)+6,num2str(MFPT(2,1)),'FontSize',20)
text(2.0,MFPT(2,2)+3,num2str(MFPT(2,2)),'FontSize',20)
text(2.7,MFPT(3,1)+6,num2str(MFPT(3,1)),'FontSize',20)
text(3.0,MFPT(3,2)+3,num2str(MFPT(3,2)),'FontSize',20)
text(3.7,MFPT(4,1)+6,num2str(MFPT(4,1)),'FontSize',20)
text(4.0,MFPT(4,2)+3,num2str(MFPT(4,2)),'FontSize',20)
text(4.7,MFPT(5,1)+6,num2str(MFPT(5,1)),'FontSize',20)
text(5.0,MFPT(5,2)+3,num2str(MFPT(5,2)),'FontSize',20)

MFPT = [54.79,56.73
        53.53,57.71
        53.61,58.50
        52.04,60.48
        51.78,61.77];
figure()
bar(MFPT)
xlabel('Deviation of Unevenness','FontSize',20)
ylabel('MFPT','FontSize',20)
ax = gca;
ax.FontSize = 20;
set(gca,'xticklabel',{'\pi/60','2\pi/60','3\pi/60','4\pi/60','5\pi/60'});
set(gca,'YLim',[0,100]);
title('MFPT of Different Deviation of Quadratic Unevenness (Error Threshold Reorientation)');
legend('Rougher Outside','Rougher Inside','Location','NorthWest')
text(0.7,MFPT(1,1)+5,num2str(MFPT(1,1)),'FontSize',20)
text(1.0,MFPT(1,2)+7,num2str(MFPT(1,2)),'FontSize',20)
text(1.7,MFPT(2,1)+5,num2str(MFPT(2,1)),'FontSize',20)
text(2.0,MFPT(2,2)+6,num2str(MFPT(2,2)),'FontSize',20)
text(2.7,MFPT(3,1)+5,num2str(MFPT(3,1)),'FontSize',20)
text(3.0,MFPT(3,2)+5,[num2str(MFPT(3,2)) '0'],'FontSize',20)
text(3.7,MFPT(4,1)+5,num2str(MFPT(4,1)),'FontSize',20)
text(4.0,MFPT(4,2)+5,num2str(MFPT(4,2)),'FontSize',20)
text(4.7,MFPT(5,1)+5,num2str(MFPT(5,1)),'FontSize',20)
text(5.0,MFPT(5,2)+5,num2str(MFPT(5,2)),'FontSize',20)