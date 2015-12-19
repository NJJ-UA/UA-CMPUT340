function Y_new=polynomial_interp(X,Y,X_new,n)
[~,l]=size(X);
A=zeros(l,n);
A(:,1)=1;
for i=2:n
    for j=i:l
        A(j,i)=A(j,i-1)*(X(j)-X(i-1));
    end
end
x=A\(Y');


[~,l_new]=size(X_new);
A_new=zeros(l_new,n);
A_new(:,1)=1;
if n>l+1
    index=l+1;
else
    index=n;
end
for i=2:index
    for j=1:l_new
        A_new(j,i)=A_new(j,i-1)*(X_new(j)-(X(i-1)));
    end
end

Y_new=A_new*x;
end



