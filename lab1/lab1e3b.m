close all;
clear all;

% At first I make 24 rays(each ray intersect four pixel) which form a 24*16
% matrix,that is B 
B=[[1 1 1 1 0 0 0 0  0 0 0 0 0 0 0 0];
[0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0];
[0 0 0 0  0 0 0 0 1 1 1 1 0 0 0 0];
[0 0 0 0  0 0 0 0 0 0 0 0 1  1 1 1];

[1 0 0 0   1 0 0 0    1 0 0 0    1 0 0 0];
[0 1 0 0   0 1 0 0    0 1 0 0    0 1 0 0];
[0 0 1 0   0 0 1 0    0 0 1 0    0 0 1 0];
[0 0 0 1   0 0 0 1    0 0 0 1    0 0 0 1];

[1 1 0 0   1 0 0 0    1 0 0 0    0 0 0 0];
[0 0 1 0   0 1 0 0    0 1 0 0    1 0 0 0];
[0 0 0 1   0 0 1 0    0 0 1 0    0 1 0 0];
[0 0 0 0   0 0 0 1    0 0 0 1    0 0 1 1];
[0 0 0 0   1 0 0 0    1 0 0 0    1 1 0 0];
[1 0 0 0   0 1 0 0    0 1 0 0    0 0 1 0];
[0 1 0 0   0 0 1 0    0 0 1 0    0 0 0 1];
[0 0 1 1   0 0 0 1    0 0 0 1    0 0 0 0];
[1 1 1 0   1 0 0 0    0 0 0 0    0 0 0 0];
[0 0 0 1   0 1 1 0    1 0 0 0    0 0 0 0];
[0 0 0 0   0 0 0 1    0 1 1 0    1 0 0 0];
[0 0 0 0   0 0 0 0    0 0 0 1    0 1 1 1];
[0 1 1 1   0 0 0 1    0 0 0 0    0 0 0 0];
[1 0 0 0   0 1 1 0    0 0 0 1    0 0 0 0];
[0 0 0 0   1 0 0 0    0 1 1 0    0 0 0 1];
[0 0 0 0   0 0 0 0    1 0 0 0    1 1 1 0];];

%but then I find that the rank of B is less than 16 so I need to find
%more,then I find 4 more rays(each ray intersect only 3 pixel so some pixel
%will not be intersected by ray)(I can find more, but 4 is enough),that is
%matrix specialB
specialB=[ [1 1 0 0   1 0 0 0  0 0 0 0   0 0 0 0];
[0 0 1 0  0 1 0 0   1 0 0 0   0 0 0 0];
[0 0 0 0  0 0 0 1   0 0 1 0   0 1 0 0];
[0 0 0 0  0 0 0 0   0 0 0 1   0 0 1 1];];

b_1 = 31;
b_2 = 22;
b_3 = 38;
b_4 = 39;
b_5 = 31;
b_6 = 35;
b_7 = 41;
b_8 = 23;
b_9 = 29;
b_10 = 33;
b_11 = 47;
b_12 = 21;
b_13 = 40;
b_14 = 22;
b_15 = 44;
b_16 = 39;
b_17 = 27;
b_18 = 35;
b_19 = 36;
b_20 = 32;
b_21 = 29;
b_22 = 25;
b_23 = 34;
b_24 = 42;

b_25 = 18;
b_26 = 25;
b_27 = 30;
b_28 = 19;

%fullsize of b ,28*1 vector
fullb=[b_1; b_2 ;b_3;b_4;b_5;b_6;b_7;b_8;b_9;b_10;b_11;b_12;b_13;b_14;b_15;b_16;b_17;b_18;b_19;b_20;b_21;b_22;b_23;b_24;b_25;b_26;b_27;b_28;];

%selected b, 16*1 vector
b=[b_1; b_2 ;b_3;b_4;b_6;b_7;b_8;b_9;b_25;b_26;b_27;b_28;b_18;b_21;b_22;b_23;];

%selected suitable subset of matrix B
A=[B(1:4,:);B(6:8,:);B(9,:);specialB;B(18,:);B(21,:);B(22,:);B(23,:);];

% Solve the selected system using Matlab's built-in LU routine
[L,U]=lu(A);
x=U\(L\b);

% Solve the selected system using Matlab's built-in LU routine
R=reshape(x,[4 4]);
R=R';
disp(R);

%solve the overdetermined system using Matlab's \ operator
testx=[B;specialB]\fullb;

%Reshape and display
testR=reshape(testx,[4 4]);
testR=testR';
disp(testR);

