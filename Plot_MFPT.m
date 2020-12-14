R_vs_MFPT = fit(R,MFPT,'poly2');
R_vs_MFPT_T = fit(R,MFPT_T,'poly1');
R_vs_MFPT_E = fit(R,MFPT_E,'poly1');

figure()
f1 = plot(R_vs_MFPT,R,MFPT);
set(f1,'MarkerSize',16);
set(f1,'LineWidth',1.5);
set(f1,'Color','r');
hold on
f2 = plot(R_vs_MFPT_T,R,MFPT_T);
set(f2,'MarkerSize',16);
set(f2,'LineWidth',1.5);
set(f2,'Color','g');
hold on
f3 = plot(R_vs_MFPT_E,R,MFPT_E);
set(f3,'MarkerSize',16);
set(f3,'LineWidth',1.5);
set(f3,'Color','b');
hold on
grid on
legend('R vs MFPT (fit)','R vs MFPT (data)','R vs MFPT (T) (fit)',...
    'R vs MFPT (T) (data)','R vs MFPT (E) (fit)','R vs MFPT (E) (data)');
xlabel('Radius (cm)','FontSize',18);
ylabel('Mean First Passage Time (s)','FontSize',18);
ax = gca;
ax.FontSize = 18;