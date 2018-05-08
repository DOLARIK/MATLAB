function Jnn = costNN(X,y,pred,K)

n = size(X,1);

Jnn = (1/n)*(-(y')*(log(pred)) - ((ones(n,k)-y)')*(log(ones(n,k)-pred)));