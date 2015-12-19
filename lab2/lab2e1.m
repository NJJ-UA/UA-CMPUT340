close all;
clear all;


m=3;
n=19;

x=0:0.5:m*pi;
y = sin(x);

X_new = (0:0.1:(2^(1/n))*m*pi);

Y=polynomial_interp(x,y,x,n);

error=norm(sin(x)-Y');
disp('Error between the interpolated y value and the ground-truth on X' );
disp(error);



Y_new=polynomial_interp(x,y,X_new,n);

error_new=norm(sin(X_new)-Y_new');
disp('Error between the interpolated y and the ground-truth on X_new:' );
disp(error_new);

figure
plot(X_new,Y_new,X_new,sin(X_new),':r')
