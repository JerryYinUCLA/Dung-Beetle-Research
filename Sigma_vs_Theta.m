function [fitresult, gof] = Sigma_vs_Theta(sigmad, theta)
%CREATEFIT(SIGMAD,THETA)
%  Create a fit.
%
%  Data for 'Fit of Sigma and Theta' fit:
%      X Input : sigmad
%      Y Output: theta
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 13-May-2019 18:35:49


%% Fit: 'Fit of Sigma and Theta'.
[xData, yData] = prepareCurveData( sigmad, theta );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'Fit of Sigma and Theta' );
plot( fitresult,'b');
hold on
scatter(sigmad,theta,48,'k','o')
legend('Fit of \sigma_d and \theta_e^*','\theta_e^* vs \sigma_d', 'Location', 'SouthEast' );
% Label axes
xlim([0.2,1.6])
xlabel('Drifting Tendency \sigma_d','FontSize',18)
ylabel('Optimal Error Threshold \theta_e^*','FontSize',18)
ax = gca;
ax.FontSize = 18;
grid on


