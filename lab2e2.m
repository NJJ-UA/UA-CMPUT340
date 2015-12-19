close all;
clear all;

I = imread('tumorContour.jpg'); 
[yg,xg]= find(I > 250);
[xgsize,~]=size(xg);
O = imread('tumor.jpg');

figure,imagesc(O),colormap(gray),axis image,hold on
inno=40;
[x,y]=ginput(inno-1);
x(inno)=x(1);
y(inno)=y(1);
increase=x(1)<x(2);
pivot=[1];
for i=2:inno
    if increase
        if x(i)<x(i-1)
            increase=false;
            pivot=[pivot i-1];
        end
    else
        if x(i)>x(i-1)
            increase=true;
            pivot=[pivot i-1];
        end
    end
end

if pivot(end)~=inno
    pivot=[pivot inno];
end
[~,pieces]=size(pivot);
pieces=pieces-1;
yr=[];
xr=[];
for i=1:pieces
    
    tx=linspace(x(pivot(i)),x(pivot(i+1)),234/pieces);
    %tx=x(pivot(i)):0.1:x(pivot(i+1));
    xr=[xr tx];
    
    [c,ix,ic]=unique(x(pivot(i):pivot(i+1)));
    d=y(pivot(i):pivot(i+1));
    yy=spline(c,d(ix),tx);
    
    yr=[yr yy];


end
plot(x,y,'or')
plot(xr,yr,'b');
hold off
[~,cut]=size(yr);

[sxr,xri]=sort(xr);
syr=yr(xri);
% for i=1:xgsize
%     
% end
error=norm(syr'-yg(1:cut));
relerror=norm(syr'-yg(1:cut))/norm(yg(1:cut));
disp('least squre error:');
disp(error);
disp('relative least squre error:');
disp(relerror);

