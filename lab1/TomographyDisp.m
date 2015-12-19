function TomographyDisp(A,B,imsize,k)
    [~,n]=size(B);
    for i=1:n
        x=A\(B(:,i));
        C=reshape(x,imsize);
        C=C';
        figure(k),subplot(1,n,i),imshow(C);
    end
end