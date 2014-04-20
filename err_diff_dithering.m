close all
clear all
clc
%% Image importing
iporig=imread('data1.jpg');
% iporig=imread('data2.jpg');
ip=rgb2gray(iporig);
for i=1:199
    for j=2:199
        if(ip(i,j)>128)
            op(i,j)=1;
        else
            op(i,j)=0;
        end
        er=op(i,j)-ip(i,j);
        ip(i+1,j-1)=ip(i+1,j-1)-er*(3/16);
        ip(i+1,j)=ip(i+1,j)-er*(5/16);
        ip(i+1,j+1)=ip(i+1,j+1)-er*(1/16);
        ip(i,j+1)=ip(i,j+1)-er*(7/16);
    end
end
%% plotting results
figure
subplot(1,2,1)
imshow(ip);
title('Original Image');
subplot(1,2,2)
imshow(op);
title('Half toned image');
