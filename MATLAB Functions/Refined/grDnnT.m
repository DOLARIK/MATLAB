function [pred,pred1,pred2] = grDnnT(X,t1,t2,t3,t4,b1,b2,b3,b4)

n = size(X,1);
wb = waitbar(0,'Iterating...');
for i = 1:n

waitbar(i/n);

a1 = X(i,:);


z2 = a1*t1 + b1;

if z2>=0;
a2 = z2; 
else a2 = .2*z2; 
end

z3 = a2*t2 + b2;
if z3>=0;
a3 = z3; 
else a3 = .2*z3;
end

z4 = a3*t3 + b3;
if z4>=0;
a4 = z4;
else a4 = .2*z4;
end

z5 = a4*t4 + b4;
pred(i,:) = ((1 + exp(-z5)).^(-1));

end
delete(wb);
pred1 = predGen(pred);
pred2 = yGenR(pred1);
plot(pred2,'x');
end