close all;
clear all;

%A is a matrix of all observation,12*9 matrix
A=[[0 0 0  0 0 0  1 1 1 ];
[0 0 0  1 1 1  0 0 0 ];
[1 1 1  0 0 0  0 0 0 ];

[0 0 0  0 0 1  0 1 1];
[0 0 1  0 1 0  1 0 0];
[1 1 0  1 0 0  0 0 0];

[0 0 1  0 0 1  0 0 1];
[0 1 0  0 1 0  0 1 0];
[1 0 0  1 0 0  1 0 0];

[0 1 1  0 0 1  0 0 0];
[1 0 0  0 1 0  0 0 1];
[0 0 0  1 0 0  1 1 0];];


b_1 = 13.00;
b_2 = 15.00;
b_3 = 8.00;
b_4 = 14.79;
b_5 = 14.31;
b_6 = 3.81;
b_7 = 18.00;
b_8 = 12.00;
b_9 = 6.00;
b_10 = 10.51;
b_11 = 16.13;
b_12 = 7.04;

%fullsize of b ,12*1 vector
b=[b_1; b_2 ;b_3;b_4;b_5;b_6;b_7;b_8;b_9;b_10;b_11;b_12;];

%selected b, 9*1 vector
blu=[b_1; b_3 ;b_4;b_5;b_6;b_7;b_9;b_10;b_11;];

%selected suitable subset of matrix A
Alu=[A(1,:);A(3,:);A(4:6,:);A(7,:);A(9,:);A(10,:);A(11,:);];

% Solve the selected system using Matlab's built-in LU routine
[L,U]=lu(Alu);
xlu=U\(L\blu);

%Reshape and display
Rlu=reshape(xlu,[3 3]);
Rlu=Rlu';
disp(Rlu);

%solve the overdetermined system using Matlab's \ operator
x=A\b;

%Reshape and display
R=reshape(x,[3 3]);
R=R';
disp(R);



