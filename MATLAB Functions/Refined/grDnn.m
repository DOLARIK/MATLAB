function [pred,t1,t2,t3,t4,a1,a2,a3,a4,b1,b2,b3,b4] = grDnn(X,y,fX,f2,f3,f4,K)

n = size(X,1);
Delta1 = zeros(fX,f2);
Db1 = zeros(1,f2);
Delta2 = zeros(f2,f3);
Db2 = zeros(1,f3);
Delta3 = zeros(f3,f4);
Db3 = zeros(1,f4);
Delta4 = zeros(f4,K);
Db4 = zeros(1,K);

%Jnn_h = zeros(n,1);
t1 = rand(fX,f2)*(2*.1) - .1;
t2 = rand(f2,f3)*(2*.1) - .1;
t3 = rand(f3,f4)*(2*.1) - .1;
t4 = rand(f4,K)*(2*.1) - .1;
pred = zeros(n,K);

b1 = ones(1,f2);
b2 = ones(1,f3);
b3 = ones(1,f4);
b4 = ones(1,K);

%Forward Propagation
wb = waitbar(0,'Iterating...');
%for o = 1:2
for i = 1:n

waitbar(i/n);

a1 = X(i,:);


z2 = a1*t1 + b1;

if z2>=0;
a2 = z2; da2 = 1;
else a2 = .2*z2; da2 = .2;
end

z3 = a2*t2 + b2;
if z3>=0;
a3 = z3; da3 = 1;
else a3 = .2*z3; da3 = .2;
end

z4 = a3*t3 + b3;
if z4>=0;
a4 = z4; da4 = 1;
else a4 = .2*z4; da4 = .2;
end

z5 = a4*t4 + b4;
pred(i,:) = ((1 + exp(-z5)).^(-1));
%Backward Propagation

d5 = (2*(pred(i,:) - y(i,:)).*pred(i,:).*(1 - pred(i,:)));
d4 = ((d5)*(t4'))*da4;
d3 = ((d4)*(t3'))*da3;
d2 = ((d3)*(t2'))*da2;

Delta1 = Delta1 + (a1')*d2;
Db1 = Db1 + d2;
Delta2 = Delta2 + (a2')*d3;
Db2 = Db2 + d3;
Delta3 = Delta3 + (a3')*d4;
Db3 = Db3 + d4;
Delta4 = Delta4 + (a4')*d5;
Db4 = Db4 + d5;


%for l = 1:2
    

t1 = t1*(.999) - .000001*(Delta1);
b1 = b1*(.999) - .000001*(Db1);
t2 = t2*(.999) - .000001*(Delta2);
b2 = b2*(.999) - .000001*(Db2);
t3 = t3*(.999) - .000001*(Delta3);
b3 = b3*(.999) - .000001*(Db3);
t4 = t4*(.999) - .000001*(Delta4);
b4 = b4*(.999) - .000001*(Db4);

%end

%end

end
%Jnn_h(i) = costNN(X,y,pred,K);
%a1; a2; a3;




delete(wb);
end

%D1 = Delta1/n;
%D2 = Delta2/n;
%D3 = Delta3/n; 
%plot(Jnn_h);

%t1,t1,t3


%end
