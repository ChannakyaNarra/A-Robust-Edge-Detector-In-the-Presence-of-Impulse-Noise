clear all;
clc;
im1 = imread('original_2.jpg');
%imshow(im1,[]); 
im1 = rgb2gray(im1);
imshow(im1,[]);
%adding salt and pepper noise
im=imnoise(im1,'salt & pepper',0.1);
im = double(im); 
im1 = double(im1);
mim = medfilt2(im);
figure;
imshow(mim,[]);
title('Basic median filter image');
%Normalising pixel values
im =(im-min(im(:)))/(max(im(:))-min(im(:)));
im1 =(im1-min(im1(:)))/(max(im1(:))-min(im1(:)));
%Switching adaptive median
medIm = medianFilter(im,im1);
figure;
imshow(medIm,[]);
title('Image after SAM filtering');
%fixed weighted mean
fwmIm = FWM(medIm);
imshow(fwmIm,[]);
title('Image after SAMFWM filtering');
figure;
fwmIm = fwmIm*255;
im1 = im1*255;
%edge detection
sobIm=Sobel1(fwmIm);
figure;
imshow(sobIm,[]);
title('Image after Sobel edge detection');
nonIm = nonMaxSupp(sobIm);
figure;
imshow(nonIm,[]);
title('resulting image');
sfpsnr = psnr(fwmIm,im1);
fprintf('\n psnr value of SAMFWM is %0.4f', sfpsnr);
mimpsnr = psnr(mim,im1);
fprintf('\n psnr value of Median filter is %0.4f', mimpsnr);
pssim = ssim(fwmIm,im1);
fprintf('\n ssim value of SAMFWM is %0.4f', pssim);
mssim = ssim(mim, im1);
fprintf('\n ssim value of Median filter is %0.4f', mssim);
pmse = immse(fwmIm,im1);
fprintf('\n mse value of SAMFWM is %0.4f', pmse);
smse = immse(mim, im1);
fprintf('\n mse value of Median filter is %0.4f', smse);

