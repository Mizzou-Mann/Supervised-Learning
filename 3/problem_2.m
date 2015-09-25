% Load data
[x1,x2,x3,x4] = textread('iris.data', '%f,%f,%f,%f,%*s');
X = [ones(length(x1),1) x1 x2 x3 x4];
[N, d] = size(X);
setosa = 1:50;
versicolor = 51:100;
y = [zeros(length(setosa),1); ones(length(versicolor),1)];

% Logistic regression gradient ascent
% initialize weight
W = zeros(d, 1);
% iterations
T = 200;
% step-size or learning rate
alpha = 0.00003;
% conditional log likelihood
lw = zeros(1, T);

for t=1:T
    prediction = exp(X*W) ./ (1+exp(X*W));
    W = W - alpha * X' * (y - prediction);
    lw(t) = y'*X*W - sum( log(1+exp(X*W)) );
end

% Evaluation
predicted = X*W

% Plot of conditional log likelihood
figure;
plot(1:T, lw);