function [pred,pred1,pred2] = grDnnT1(X,t1,t2,t3,s)

    a1 = (X)' ;
    
    z2 = t1*a1;
    a2 = relu(z2,s);
    
    z3 = t2*a2;
    a3 = relu(z3,s);
    
    z4 = t3*a3;
    pred = sigmoid(z4);
    
pred = pred';
    
pred1 = predGen(pred);
pred2 = yGenR(pred1);
plot(pred2,'x');

end

