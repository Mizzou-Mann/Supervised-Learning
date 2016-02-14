function [Beta, prediction, E] = p_regression(x, y, p)
% P_REGRESSION polynomial regression model


A = make_A(x, p);
Beta = (A'*A)\A'*y;
display(Beta);

% Evaluation
prediction = A*Beta;

% E = expected_loss_beta
E = (y-prediction)' * (y-prediction) / length(y);
display(E);
