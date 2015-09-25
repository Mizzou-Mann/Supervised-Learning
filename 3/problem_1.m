% Load data
x = [1.47 1.5 1.52 1.55 1.57 1.6 1.63 1.65 1.68 1.7 1.73 1.75 1.78 1.8 1.83]';
y = [52.21 53.12 54.48 55.84 57.2 58.57 59.93 61.29 63.11 64.47 66.28 68.1 69.92 72.19 74.46]';

% Linear regression
A = [ones(length(x), 1) x];
beta = (A'*A)\A'*y;

% Polynomial regression
A = [A x.^2];
beta_2 = (A'*A)\A'*y;

% Evaluation
prediction = A*beta_2;
expected_loss = (y-prediction)' * (y-prediction) / length(y);

display(prediction);
display(expected_loss);

% Plot
figure;
scatter(x, y); hold on;
x_value = linspace(1.3, 2);
plot(x_value, beta(1) + beta(2)*x_value, 'r');
plot(x_value, beta_2(1) + beta_2(2)*x_value + beta_2(3)*x_value.^2, 'g');
hold off;
title('Plot of data and regression lines');
xlabel('Height');
ylabel('Weight');
legend('Data', 'Linear regression', 'Polynomial regression');