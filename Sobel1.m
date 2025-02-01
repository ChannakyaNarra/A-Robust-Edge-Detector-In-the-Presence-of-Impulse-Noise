function [t]=Sobel1(im)
% clear all;
% clc;
% im = imread('flower.jpg');
% im = uint8(im);
% imshow(im); figure;
% im = rgb2gray(im);
% im = double(im);
filtered_image = zeros(size(im));
Mx = [-1 0 1; -2 0 2; -1 0 1];
My = [-1 -2 -1; 0 0 0; 1 2 1];

for i = 1:size(im, 1) - 2
	for j = 1:size(im, 2) - 2
		Gx = sum(sum(Mx.*im(i:i+2, j:j+2)));
		Gy = sum(sum(My.*im(i:i+2, j:j+2)));
		filtered_image(i+1, j+1) = sqrt(Gx.^2 + Gy.^2);
	end
end
 filtered_image = uint8(filtered_image);
 imshow(filtered_image); 
thresholdValue = 100; 
oim = max(filtered_image, thresholdValue);
oim(oim == round(thresholdValue)) = 0;
oim = im2bw(oim);
% figure, imshow(oim); title('Edge Detected Image');
t=oim;
