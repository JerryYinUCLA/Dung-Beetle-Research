function [fitresult, gof] = createFit(N, B100V4)
%CREATEFIT(N,B100V4)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : N
%      Y Output: B100V4
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 17-May-2020 16:42:05


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( N, B100V4 );

% Set up fittype and options.
ft = fittype( 'rat11' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.743132468124916 0.392227019534168 0.655477890177557];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
% h = plot( fitresult, xData, yData );
h1 = plot(fitresult,'b');
hold on
h2 = scatter(xData,yData,32,'k','filled');

legend( [h1 h2], {'Fitted Line', 'Chased Percentage vs. Number of Chasers'}, 'Location', 'NorthEast' );
% Label axes
set(gca,'Xlim',[0,16])
set(gca,'YLim',[0,100])
xlabel('Number of Chasers','FontSize',18)
ylabel('Chased Percentage (%)','FontSize',18)
title('Fitted Curve of Chased Percentage and Number of Chasers (B100V4)','FontSize',20)
set(gca,'xticklabel',{0,2,4,6,8,10,12,14,16},'FontSize',18)
set(gca,'yticklabel',{0,20,40,60,80,100},'FontSize',18)
grid on

