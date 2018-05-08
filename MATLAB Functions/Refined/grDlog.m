function [theta, Jlog_h, pred] = grDlog(X,y,theta,alpha,iter)

m = size(X,1);
Jlog_h = zeros(iter);
z = (X*theta);
pred = (1 + exp(-z)).^(-1);

for i = 1:iter
    theta = theta - (alpha/m)*(X')*(pred - y);
    Jlog_h(i) = costLog(X,y,theta);
    
end
plot(Jlog_h);
end