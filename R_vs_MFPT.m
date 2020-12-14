function [fitresult, gof] = createFit(R, MFPT)
%CREATEFIT(R,MFPT)
%  Create a fit.
%
%  Data for 'Radius vs MFPT' fit:
%      X Input : R
%      Y Output: MFPT
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 24-Oct-2019 11:08:28


%% Fit: 'Radius vs MFPT'.
[xData, yData] = prepareCurveData( R, MFPT );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'Radius vs MFPT' );
h=plot(fitresult);
hold on
scatter(xData, yData,24);
legend( h, 'MFPT vs. R', 'Radius vs MFPT', 'Location', 'Northwest' );
% Label axes
xlabel('Radius (R)','FontSize',18)
ylabel('Mean First Passage Time','FontSize',18)
title('Relationship between R and MFPT (E)')
ax = gca;
ax.FontSize = 14;
set(gca,'XLim',[0,2.25]);
grid on


