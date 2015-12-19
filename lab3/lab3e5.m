close all;
clear all;

load light_pca

degree=6;

[n,~]=size(Y);

X_new=-120:5:120;
X_omit=[X(:,1:7) X(:,9:end)];
Y_omit=[Y(:,1:7) Y(:,9:end)];



 Y_new=polynomial_interp(X,Y,X_new,degree);
for i=1:n
    figure(i),plot(X,Y(i,:),'*'),axis([-125 125 -1.1 1.1])
    hold on
    plot(X_new,Y_new(i,:))
    hold off
    
end

pause();
close all;


for c = 1:size(Y_new,2)
  Ic = renderim(Y_new(:,c),B,imsize);
  imshow(Ic)
  drawnow
end

pause();
close all;

Y_new=linear_interp(X,Y,X_new);

for i=1:n
    figure(i),plot(X,Y(i,:),'*'),axis([-125 125 -1.1 1.1])
    hold on
    plot(X_new,Y_new(i,:))
    hold off
    
end

pause();
close all;



for c = 1:size(Y_new,2)
  Ic = renderim(Y_new(:,c),B,imsize);
  imshow(Ic)
  drawnow
end

pause();
close all;

Y_omit_lin=linear_interp(X_omit,Y_omit,X_new);
Y_omit_poly=polynomial_interp(X_omit,Y_omit,X_new,degree);

display('Difference between original one and linear interpolation one:');
nlin=norm(Y(:,8)-Y_omit_lin(:,27));
display(nlin);

display('Difference between original one and polynomial interpolation one:');
npoly=norm(Y(:,8)-Y_omit_poly(:,27));
display(npoly);


Io = renderim(Y(:,8),B,imsize);
Il = renderim(Y_omit_lin(:,27),B,imsize);
Ip = renderim(Y_omit_poly(:,27),B,imsize);
subplot(1,3,1),imshow(Io)
subplot(1,3,2),imshow(Il)
subplot(1,3,3),imshow(Ip)

pause();


close all;
clear all;

load obj_pca

degree=20;

[n,~]=size(Y);

X_new=0:1.25:355;




 Y_new=polynomial_interp(X,Y,X_new,degree);
for i=1:10
    iv=(i-1)*7+1:i*7;
    if i==10
        iv=64:73;
    end
    figure(i),plot(X,Y(iv,:),'*')
    hold on
    plot(X_new,Y_new(iv,:))
    hold off
    
end

pause();
close all;


for c = 1:size(Y_new,2)
  Ic = renderim(Y_new(:,c),B,imsize);
  imshow(Ic)
  drawnow
end

pause();
close all;

Y_new=linear_interp(X,Y,X_new);

for i=1:10
    iv=(i-1)*7+1:i*7;
    if i==10
        iv=64:73;
    end
    figure(i),plot(X,Y(iv,:),'*')
    hold on
    plot(X_new,Y_new(iv,:))
    hold off
    
end

pause();
close all;



for c = 1:size(Y_new,2)
  Ic = renderim(Y_new(:,c),B,imsize);
  imshow(Ic)
  drawnow
end