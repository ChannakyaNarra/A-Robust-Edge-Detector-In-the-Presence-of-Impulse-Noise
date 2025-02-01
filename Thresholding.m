function [t] = Thresholding(im)
t = 0.5;
[r,c]=size(im);
for i=2:r-1
    for j=2:c-1
        if(im(i,j)>=t)
            im(i,j) = 1;
        end
        if(im(i,j)<t)
            im(i,j) = 0;
        end
    end
end
figure;imshow(im);
title(' Threshold Image');
t = im;

        