function [theta, J_history] = gradientDescent(X, y, theta, alpha, iterations)

m = length(y); % number of training examples
J_history = zeros(iterations, 1);

for iter = 1:iterations
    
theta = theta - (alpha/m)*(X')*(X*theta - y);

    J_history(iter) = computeCost(X, y, theta);

end

end
