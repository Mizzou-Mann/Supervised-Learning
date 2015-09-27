% Load data
x = [1.47 1.5 1.52 1.55 1.57 1.6 1.63 1.65 1.68 1.7 1.73 1.75 1.78 1.8 1.83]';
y = [52.21 53.12 54.48 55.84 57.2 58.57 59.93 61.29 63.11 64.47 66.28 68.1 69.92 72.19 74.46]';

% Linear regression
A = [ones(length(x), 1) x];
Beta = (A'*A)\A'*y;
display(Beta);

% Evaluation
prediction = A*Beta;
expected_loss_beta = (y-prediction)' * (y-prediction) / length(y);
display(expected_loss_beta);

% Polynomial regression
A = [A x.^2];
Beta_2 = (A'*A)\A'*y;
display(Beta_2);

% Evaluation
prediction = A*Beta_2;
expected_loss_beta2 = (y-prediction)' * (y-prediction) / length(y);
display(expected_loss_beta2);

% Plot
figure;
scatter(x, y); hold on;
x_value = linspace(1.3, 2);
plot(x_value, Beta(1) + Beta(2)*x_value, 'r');
plot(x_value, Beta_2(1) + Beta_2(2)*x_value + Beta_2(3)*x_value.^2, 'g');
hold off;
title('Plot of data and regression lines');
xlabel('Height');
ylabel('Weight');
legend('Data', 'Linear regression', 'Polynomial regression');