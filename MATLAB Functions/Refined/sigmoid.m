function [p,pp] = sigmoid(a)

p = ((1 + exp(-a)).^(-1));
pp = a.*(1 - a);

end