clear all;
close all;
Im=imread('neha1.png');
%%
[a b]=size(Im)
%% 
imfinfo('neha1.png');
%%
whos Im
%% Display image 
imshow(Im)
I = Im(:,:,1);
%%
%%%figure(1),imshow(I)
 %%image histogram
imhist(I)
%% write image 
imwrite(I,'imgedit1.png');
%% Image enhancement 
%%% Intensity transformation 
%%%% Direct mapping/ gamma transformation 
I1 =imadjust(I);
imshow(I1)
%%
%%%%2) Negative transformation 
I2=imcomplement(I);
imshow(I2)