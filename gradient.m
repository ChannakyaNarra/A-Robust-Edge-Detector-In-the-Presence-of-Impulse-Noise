function [ mag,dir ] = gradient(I,h1,h2)
[m,n]=size(I);
mag=I;
dir=zeros(size(I));
for i=2:m-1
    for j=2:n-1
        x=convolution(h2,I(i-1:i+1 ,j-1:j+1));
        y=convolution(h1,I(i-1:i+1 ,j-1:j+1));
        mag(i,j)=sqrt(x^2 +y^2);
        dir(i,j)=(180*atan2(y,x)/pi);

    end
end
end