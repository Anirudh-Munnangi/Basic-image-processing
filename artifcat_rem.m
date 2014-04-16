clear all
close all
clc
%original image
im=imread('p_14_2.jpg');
%rgb image
img=rgb2gray(im);
figure(1)
imshow(img)
title('Original Image');
%% 1 ) filtering with median filter strategy
% considering an mask of size 1x6
origimg=img;
lr=length(img(:,1));
lc=length(img(1,:));
% running the loop for median filtering
for i=3:(lr-2)
    for j=4:(lc-3)
        %temp=[img(i-1,j-1:j+1) img(i,j-1:j+1) img(i+1,j-1:j+1)];
        temp=[img(i,j-3:j+2) img(i,j-3:j+2) img(i,j-3:j+2) img(i,j-3:j+2) img(i,j-3:j+2)];
        sorted=sort(temp);
        med_val=sorted(5);
        imgn(i,j)=med_val;
    end
end

figure(2)
subplot(1,2,1)
imshow(origimg);
title('Noise image');
subplot(1,2,2)
imshow(imgn);
title('Median filtered image');

%% 2) Thresholding
threshold=7/255;
imgbw=im2bw(imgn,threshold);
figure(3)
imshow(imgbw)
title('Threshold Map');
lr=length(imgbw(:,1));
lc=length(imgbw(1,:));
% Updating the logical map to fit the size of the original image
imgbw=[imgbw; zeros(2,lc)];
lr=length(imgbw(:,1));
lc=length(imgbw(1,:));
imgbw=[imgbw(:,1:lc-3) (zeros(3,lr))' imgbw(:,lc-2:lc)];
lr=length(imgbw(:,1));
lc=length(imgbw(1,:));
%% 3) Mapping the logical map onto the original image
% making the values in logical into int8 type
imgbw=uint8(imgbw);
% Mapping
newimg=img.*imgbw;
figure(4)
subplot(1,2,1)
imshow(img);
title('Original Image with artifacts');
subplot(1,2,2)
imshow(newimg);
title('Clear Image');
