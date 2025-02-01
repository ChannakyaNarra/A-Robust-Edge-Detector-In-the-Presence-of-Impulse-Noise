function [t] = wmeanF(i,j,im)
sum = (2*im(i,j+1))+(2*im(i+1,j))+im(i+1,j+1);
wmean = sum/3;
t = wmean;
