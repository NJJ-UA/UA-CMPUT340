t1=[mean(Y1,2)];
Y1n=Y1-t1*ones(1,size(Y1,2));
C1=(Y1n*Y1n')/size(Y1,2);
[V1,D1]=eig(C1);
A1=V1*(D1^0.5)

% Gaussian distr, Box-Mueller method
n = 400
U = rand(2,n);
v = 2*pi*U(2,:);
G = ones(2,1)*sqrt(-2.*log(U(1,:))).*[cos(v);sin(v)];

plot(G(1,:),G(2,:),'.')
axis equal

% Transform
A = [1 .5
     .5 0.5];
t = [8; 1];
Y = A*G+t*ones(1,n);
plot(Y(1,:),Y(2,:),'.')
axis equal
hold on