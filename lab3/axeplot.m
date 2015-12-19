function axeplot(V,D,t)
hold on
plot([t(1) 2*sqrt(D(1,1))*V(1,1)+t(1)],[t(2) 2*sqrt(D(1,1))*V(2,1)+t(2)],'r')
plot([t(1) 2*sqrt(D(2,2))*V(1,2)+t(1)],[t(2) 2*sqrt(D(2,2))*V(2,2)+t(2)],'g')
hold off
end