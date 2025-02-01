function [t] = FWM(im)
[r,c]=size(im);
n=im;
for i=2:r-1
    for j=2:c-1
        mean = meanF(i,j,im);
        wmean = wmeanF(i,j,im);
        sum = wmean*3;
        if sum>=3
            n(i,j) = mean;
        else
            n(i,j) = mean;
        end
    end
end
t = im;
figure;
imshow(n,[]);

            