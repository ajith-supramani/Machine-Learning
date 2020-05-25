function [] = sub()


% ====================== YOUR CODE HERE ======================

% Load initial data
data1 = load('ex2data2.txt');
X = data1(:, 1:2); y = data1(:, 3);

% % Plot the data with + indicating (y = 1) examples and o indicating (y = 0) examples.
% plotData(X, y);
% 
% % Labels and Legend
% xlabel('Microchip Test 1');
% ylabel('Microchip Test 2');
% 
% % Specified in plot order
% legend('Accepted', 'Rejected');

% Add Polynomial Features
% Note that mapFeature also adds a column of ones for us, so the intercept term is handled
X = mapFeature(X(:,1), X(:,2));

% Initialize fitting parameters
initial_theta = zeros(size(X, 2), 1);

% Set regularization parameter lambda to 1
lambda = 1;

% Compute and display initial cost and gradient for regularized logistic regression
[cost, grad] = costFunctionReg(initial_theta, X, y, lambda);
fprintf('Cost at initial theta (zeros): %f\n', cost);

disp('Gradient at initial theta (zeros):'); disp(grad);

% Set Options
options = optimoptions(@fminunc,'Algorithm','Quasi-Newton','GradObj', 'on', 'MaxIter', 1000);

% Optimize
[theta, cost] = fminunc(@(t)(costFunctionReg(t, X, y, lambda)), initial_theta, options);

% Print theta
fprintf('Cost at theta found by fminunc: %f\n', cost);
disp('theta:');disp(theta);


% Plot Boundary
plotDecisionBoundary(theta, X, y);
hold on;
title(sprintf('lambda = %g', lambda))

% Labels and Legend
xlabel('Microchip Test 1')
ylabel('Microchip Test 2')

legend('y = 1', 'y = 0', 'Decision boundary')
hold off;

% Compute accuracy on our training set
p = predict(theta, X);

fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);

% =============================================================

end
