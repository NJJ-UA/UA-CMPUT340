% Sample script  that shows how to automate running problem solutions
close all;
clear all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% a) Load an image using the imread command 
A=imread('test.jpeg');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% b) Display original image in the first spot of a 2 x 3 a grid layout
%    Check the imshow and subplot commands.

figure(1),subplot(2,3,1),imshow(A);
pause();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% c) Display a gray scale version of the image in position 2 of the grid.
%    help rgb2gray
G=rgb2gray(A);
figure(1),subplot(2,3,2),imshow(G);
pause();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% d) Generate a new figure and ask user to manually select a region of the
%    image. Display the subimage in position 3 of the grid.

% Get user input on a newly dislayed image

% Make grid the current figure

% Display selected region. Note the last : which applies the cut
% over all 3 channels.
figure(2),imshow(A);
rect=getrect(figure(2));
% another option:use ginput
% [x,y]=ginput(2);
% figure(1);
%C=A(min(y):max(y),min(x):max(y),:);
 C=A(rect(2):rect(2)+rect(4),rect(1):rect(1)+rect(3),:);
 figure(1),subplot(2,3,3),imshow(C);
 pause();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% e) Create a function J = luminance_change(I, target, value) such that:
%   * When given the option 'c', image I's contrast will be modified by
%     the given value. Simple multiplcation will achieve this.
%   * When given the option 'b', image I's brightness will be modified by
%     the given value. Simple addition will achieve this.
%  
%   Showcase your function by filling positions 4 and 5 in the grid

% Contrast change
U=luminance_change(A,'c',0.5);
figure(1),subplot(2,3,4),imshow(U);
pause();

% Brightness change
V=luminance_change(A,'b',88);
figure(1),subplot(2,3,5),imshow(V);
pause();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% f) BONUS: Display a version of the image after it's been blurred using a
%    Gaussian filter.
B= imgaussfilt(A,10);
figure(1),subplot(2,3,6),imshow(B);

