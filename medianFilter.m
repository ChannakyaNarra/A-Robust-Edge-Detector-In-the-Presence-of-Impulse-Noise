 function [t]=medianFilter(im,im1)
% close all;
% clc;
% im=imread('flower99.jfif');
% im=imnoise(im,'salt & pepper',0.1);
% im=rgb2gray(im);
[r,c]=size(im1);
n = im1;
for i=2:r-1
    for j=2:c-1
        mat=[im(i-1,j-1),im(i-1,j),im(i-1,j+1),im(i,j-1),im(i,j),...
        im(i,j+1),im(i+1,j-1),im(i+1,j),im(i+1,j+1)];
        mat=sort(mat);
        val = mat(5);
        v = var(mat);
        if(i>=3 && j>=3 && i<r-2 && j<c-2 && (v)>(val+val))
            val = medianFilter55(i,j,im);
        end
        n(i,j) = val; 
    end
end
figure;
imshow(im,[]);
title('Image corrupted with Salt & Pepper Noise');
% figure;imshow(n,[]);
% title('Image after filtering');
t = n;