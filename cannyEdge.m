clc;
clear all;
img  = imread('samfwm_8.jpg');
image(img)
title('Original Image')
figure,
I = rgb2gray(img);
imshow(uint8(I))
image(I)
title('Grey Scaled Image')
figure,
Canny_img = edge(I,'sobel');
imshow(Canny_img)
image(Canny_img*255)
title('Edge Detected Image')