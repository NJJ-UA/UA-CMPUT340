close all;
clear all;

z=8;
xk=0.3;
r=[xk];
for i=1:15
 % xk=(z+xk)/(1+xk);
  xk=xk-(xk^3-z)/(3*xk^2);
  r=[r xk];
end


% odd=r(:,1:2:end);
% even=r(:,2:2:end);
hold on
% odde=abs(odd-4*ones(size(odd)));
% evene=abs(even-4*ones(size(even)));

e=abs(r-sqrt(z)*ones(size(r)));


%plot(r);
% plot(odd);
% plot(even,'--');
plot(e);

hold off
