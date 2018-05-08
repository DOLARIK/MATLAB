function  y = bwC(a)

i = size(a,1);
j = size(a,2);
k = size(a,3);
a1 = a(:,:,1); a2 = a(:,:,2); a3 = a(:,:,3);
figure,imshow(a1);
figure,imshow(a2);
figure,imshow(a3);
figure,imshow(a);
avg1 = sum(a1(:))/(i*j);
avg2 = sum(a2(:))/(i*j);
avg3 = sum(a3(:))/(i*j);
avg = (avg1 + avg2 + avg3)/3;
%wb = waitbar(0,'Processing...');
for l = 1:(i*j*k)
    if a(:) <= avg;
        a(:) = 0;
    else a(:) = 1;
    end
end


%delete(wb);
y(:) = a(:);
figure,imshow(y);
end
