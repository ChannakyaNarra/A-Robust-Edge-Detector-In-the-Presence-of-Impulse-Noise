function [t] = meanF(i,j,im)
sum = im(i,j+1)+im(i+1,j)+im(i+1,j+1);
mean = sum/3;
t = mean;