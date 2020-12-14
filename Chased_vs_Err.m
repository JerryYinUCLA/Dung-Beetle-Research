function [fitresult, gof] = createFit(Error, MFPT2)
%CREATEFIT(ERROR,MFPT2)
%  Create a fit.
%
%  Data for 'ErrSig vs Chased' fit:
%      X Input : Error
%      Y Output: MFPT2
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 17-May-2020 17:06:08


%% Fit: 'ErrSig vs Chased'.
[xData, yData] = prepareCurveData( Error, MFPT2 );

% Set up fittype and options.
ft = fittype( 'exp2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [53.6764668151277 -2.12165895293807 24.5460941130975 0.131145562819613];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'ErrSig vs Chased' );
% h = plot( fitresult, xData, yData );
h1 = plot(fitresult,'b');
hold on
h2 = scatter(xData,yData,32,'k','filled');

legend( [h1 h2], {'Fitted Curve', 'Simulation Data'}, 'Location', 'NorthEast' );
% Label axes
set(gca,'XLim',[0,3.2])
set(gca,'YLim',[25,75])
xlabel('Error Threshold \theta_e','FontSize',16)
ylabel('Percentage Captured','FontSize',16)
title('Escaping Searches with Error Threshold Reorientaion','FontSize',20)
set(gca,'xticklabel',{0,0.5,1.0,1.5,2.0,2.5,3.0},'FontSize',16)
set(gca,'yticklabel',{25,30,35,40,45,50,55,60,65,70,75},'FontSize',16)
grid on
axis('square')




