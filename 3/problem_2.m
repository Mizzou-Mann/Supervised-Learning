% Load data
[x1,x2,x3,x4] = textread('iris.data', '%f,%f,%f,%f,%*s');
X = [ones(length(x1),1) x1 x2 x3 x4];

setosa = 1:50;
versicolor = 51:100;
[~, d] = size(X);
y = [zeros(length(setosa),1); ones(length(versicolor),1)];

% Logistic regression gradient ascent
% initialize weight = [-1, 1]
W = 2*rand(d, 1)-1;
% maximum iteration
T = 100000;
% learning rate
alpha = 0.001;
% conditional log likelihood
lw = zeros(1, T);

t = 1;
while true
    prediction = exp(X*W) ./ (1+exp(X*W));
    W = W + alpha * X' * (y - prediction);
    lw(t) = y'*X*W - sum( log(1+exp(X*W)) );
    if t > 1
        delta_lw = abs( (lw(t) - lw(t-1)) / lw(t-1) );
        % convergence criterion = percentage change < 0.1%
        % or the maximum iteration is reached
        if delta_lw < 1e-3 || t == T
            break;
        end
    end
    t = t + 1;
end

% Evaluation
classification = X*W > 0;
accuracy = sum(classification == y) / length(y);

display(accuracy);

% Plot of conditional log likelihood
figure;
plot(1:t, lw(1:t));
title(['Conditional log likelihood score (finish at t=' num2str(t) ')']);
xlabel('Iterations');
ylabel('l(w)');