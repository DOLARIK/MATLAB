function [theta, z] = grDlin(X,y,alpha,iter)

theta = zeros(size(X,2),1);
m = size(X,1);
Jlin_h = zeros(iter);
z = (X*theta);


for i = 1:iter
    theta = theta - (alpha/m)*(X')*(z - y);
    Jlin_h(i) = costLin(X,y,theta);
    
end
plot(Jlin_h);
end