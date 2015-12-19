close all;
clear all;

load sincos_basis

newB=[2*B(:,1).*B(:,2) ones(size(B,1),1)-2*B(:,1).*B(:,1)];
newY=[ones(1,size(Y,2))-2*Y(2,:).*Y(2,:); 2*Y(1,:).*Y(2,:)];
    
for i=1:64
    Ii = renderim(Y(:,i),B,imsize); 
    subplot(1,3,1),imshow(Ii,[]);
    
    Ii = renderim(Y(:,i),newB,imsize); 
    subplot(1,3,2),imshow(Ii,[]);
    
    Ii = renderim(newY(:,i),B,imsize); 
    subplot(1,3,3),imshow(Ii,[]);
    
    drawnow; 
    pause(0.1);
end