close all
clear all

t=[0   1   2   3   4   5];
y=[1 2.7 5.8 6.6 7.5 9.9];

for n=0:5
    
   [p,S]=polyfit(t,y,n) 
    
   px=linspace(0,5);
   py=polyval(p,linspace(0,5));
   figure(1),plot(px,py,t,y,'o')
end