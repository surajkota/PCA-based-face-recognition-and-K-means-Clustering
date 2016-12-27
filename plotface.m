function y = plotface(pc, num)

facepc1=zeros(50,50);
itr=0;
for i=1:50
    for j=1:50
        itr=itr+1;
        facepc1(i,j)=pc(itr,num);
    end
end
figure
y=imagesc(facepc1);
colormap gray;
end