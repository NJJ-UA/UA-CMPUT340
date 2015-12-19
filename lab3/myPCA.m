function [V,D,t,A]=myPCA(Y)
t=mean(Y,2);
Yn=Y-t*ones(1,size(Y,2));
C=(Yn*Yn')/size(Y,2);
[V,D]=eig(C);
A=V*(D^0.5);
end