function [fitresult, gof] = ErrorThreshold_vs_Sigma(Error, MFPT2)
%CREATEFIT(ERROR,MFPT2)
%  Create a fit.
%
%  Data for 'untitled fit 2' fit:
%      X Input : Error
%      Y Output: MFPT2
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 10-Jul-2020 10:52:30


%% Fit: 'untitled fit 2'.
[xData, yData] = prepareCurveData( Error, MFPT2 );

% Set up fittype and options.
ft = fittype( 'exp2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [1195.11817840197 -3.30140930177129 36.5227747368774 0.138081936700035];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Error Threshold vs MFPT' );
% h = plot( fitresult, xData, yData );
h1 = plot(fitresult,'b');
hold on
h2 = scatter(xData,yData,32,'k','filled');

legend( [h1 h2], {'MFPT vs. Error Threshold', 'Fitted MFPT vs. Error Threshold'}, 'Location', 'NorthEast' );
% Label axes
set(gca,'XLim',[0,3.2])
% set(gca,'YLim',[25,75])
xlabel('Error Threshold','FontSize',18)
ylabel('MFPT (s)','FontSize',18)
title('Fitted Curve of MFPT and Error Threshold','FontSize',20)
set(gca,'xticklabel',{0,1.0,2.0,3.0},'FontSize',18)
% set(gca,'yticklabel',{25,30,35,40,45,50,55,60,65,70,75},'FontSize',18)
grid on