function [prd, t1,t2,t3, loss] = grDNn1(X,y,f2,f3,k,s,l,G)

% 150 and 50     50 and 50

y = y';
n = size(X,1);
fX = size(X,2);
loss = zeros(G,1);
lss = zeros(n,1);

t1 = rand(f2,fX)*(2*.1) - .1;
t2 = rand(f3,f2)*(2*.1) - .1;
t3 = rand(k,f3)*(2*.1) - .1;
pred = zeros(k,n);

D1 = zeros(f2,fX);
D2 = zeros(f3,f2);
D3 = zeros(k,f3);

wb = waitbar(0,'Iterating...');

for g = 1:G
waitbar(g/G);
f = max(factor(n));
%o = n/f;
%o = f;
o = f;    
    for i = 1:o:n
    
        
    %Forward Feed
        a1 = (X(i:i+o-1,:))' ;
    
        z2 = t1*a1;
        [a2,a2p] = relu(z2,s);
    
        z3 = t2*a2;
        [a3,a3p] = relu(z3,s);
    
        z4 = t3*a3;
        pred(:,i:i+o-1) = sigmoid(z4);
    
    %Backprop
    
        d4 = pred(:,i:i+o-1) - y(:,i:i+o-1);
        d3 = (t3'*d4).*a3p;
        d2 = (t2'*d3).*a2p;
    
        D1 = D1 + d2*a1';
        D2 = D2 + d3*a2';
        D3 = D3 + d4*a3';
    
    %Gradient Descent
    
        t1 = t1 - (l/n)*D1;
        t2 = t2 - (l/n)*D2;
        t3 = t3 - (l/n)*D3;
    
        lss(i:i+o-1) = sum(-(1/n)*((y(:,i:i+o-1)')*log(pred(:,i:i+o-1)) + ((1 - y(:,i:i+o-1))')*log(1 - pred(:,i:i+o-1))));
        %lss(i:i+o-1) = sum((1/n)*((y(:,i:i+o-1) - pred(:,i:i+o-1)).^2));
        if i == n + 1 - o;
            loss(g) = sum(lss);
        end
        
        if g >= 2
            if loss(g) > loss(g-1)
                l = l/1.5;
            end           
        end

    end
end


delete(wb);
prd = pred';
plot(loss);

end
