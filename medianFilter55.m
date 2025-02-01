function [t]=medianFilter55(i,j,im)
% im = imread('lena99.png');
% im=imnoise(im,'salt & pepper',0.1);
%[r,c]=size(im);
%n=zeros(r,c);
% for i=3:r-2
%     for j=3:c-2
        mat1=[im(i-2,j-2),im(i-2,j-1),im(i-2,j),im(i-2,j+1),im(i-2,j+2),...
            im(i-1,j-2),im(i-1,j+2),im(i-1,j-1),im(i-1,j),im(i-1,j+1),...
            im(i,j-2),im(i,j-1),im(i,j),im(i,j+1),im(i,j+2),...
            im(i+1,j-2),im(i+1,j-1),im(i+1,j),im(i+1,j+1),im(i+1,j+2),...
            im(i+2,j-2),im(i+2,j-1),im(i+2,j),im(i+2,j+1),im(i+2,j+2)];
        mat1=sort(mat1);
        mid = mat1(13);
%     end
% end
% figure;
% imshow(im,[]);
% title('Image corrupted with Salt & Pepper Noise');
% figure;imshow(n,[]);
% title('Image after filtering');
t = mid;