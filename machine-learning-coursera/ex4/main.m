function [] = main()


% ====================== YOUR CODE HERE ======================

% Load initial data
load('ex4data1.mat');
m = size(X, 1);

% Randomly select 100 data points to display
sel = randperm(size(X, 1));
sel = sel(1:100);

displayData(X(sel, :));

% Load the weights into variables Theta1 and Theta2
load('ex4weights.mat');
 

% =============================================================

end
