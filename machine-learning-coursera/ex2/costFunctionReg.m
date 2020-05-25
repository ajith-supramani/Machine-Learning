function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

tempTheta = theta;
tempTheta(1) = 0;

val = X * theta;
hypo = sigmoid(val);

J = -(1/m) * sum((y .* log(hypo)) + ((1-y) .* log(1 - hypo))) + (lambda/(2*m)) * sum(tempTheta .^ 2);
grad = (1/m) * (X' * (hypo - y)) + (lambda / m) * tempTheta;


% =============================================================

end