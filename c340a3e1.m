close all;
clear all;

xk=0.1;
r=[xk];
for i=1:10
  xk1=xk-(sin(10*xk)-xk)/(10*cos(10*xk)-1);
  xk=xk1;
  r=[r xk];
end
