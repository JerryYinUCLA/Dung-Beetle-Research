% figure('Name','Scatter Plot of Sigma and T');
% scatter(sigma5,T5,64,'b','o');
% hold on
% scatter(sigma28,T28,64,'b','o');
% a = [0.3927 0.3927];
% b = [0 50];
% %p = plot(a,b,'r');
% %p.LineWidth = 1.5;
% xlim([0,1.6])
% ylim([0,50])
% xlabel('Drifting Tendency \sigma_d','FontSize',18);
% ylabel('Optimal Reorientation Period T^* (s)','FontSize',18);
% ax = gca;
% ax.FontSize = 18;
% 
% figure('Name','Scatter Plot of Sigma and Error');
% scatter(sigmar,error,64,'b','o')
% xlim([0,1.6])
% xlabel('Drifting Tendency \sigma_d','FontSize',18);
% ylabel('Optimal Reorientation Period T^* (s)','FontSize',18);
% ax = gca;
% ax.FontSize = 18;

figure('Name','Comparison of Three Methods');
% fH = gcf; colormap(jet(4));
h = bar(comparison);
xlabel('Drifting Tendency $$\sigma_d$$','FontSize',22,'Interpreter','Latex');
ylabel('Mean First Passage Time $$\bar{\tau}$$ (s)','FontSize',22,'Interpreter','Latex');
set(gca,'xticklabel',{'3\pi/60','6\pi/60','9\pi/60','12\pi/60','15\pi/60','18\pi/60'});
ax = gca;
ax.FontSize = 20;
legend('No Reorientation','Periodic','Error Threshold','FontSize',20,'Location','northwest')
% applyhatch_pluscolor(fH, '\-x.', 0, 1, jet(4));
