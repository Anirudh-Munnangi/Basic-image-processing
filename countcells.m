close all
clear all
clc
%% importing image which is grayscale originally
img_gs=imread('Normal1.jpg');
figure
imshow(img_gs);
title('Original Image: Grayscale');
%% Thresholding the image
th=175/255;
img_t=im2bw(img_gs,th);
figure
imshow(img_t);
title('Thresholded Image');
%% Inverting the colors
imginv=~img_t;
figure
imshow(imginv);
title('Threshold Image-Color Inverted');
%% removing the big part of the image
% a good approximate of the threshold is 10K
% first best approximate of threshold after hit and trial is 400
subimg=bwareaopen(imginv,400);
figure
imshow(subimg);
title('image after small pixels removed');

newimg=imginv-subimg;
figure
imshow(newimg);
title('Image of the small parts');
img_t=newimg;
%% Counting the number of borders
b=bwboundaries(img_t);
figure
hold on
imshow(img_t);
title('Threshold Image-Color Inverted');
text(10,10,strcat('\color{green}Objects Found:',num2str(length(b))));
