%imshow(imread('subject1_img3.pgm'));
clearvars;
load('gallery.mat');
load('probe.mat');
% files=dir('*_im1.pgm');
% size(files);
% gallery=[];
% for index=1:100
%     jpgFileName = strcat('GallerySet/subject', num2str(index), '_img1','.pgm');
%     temp=imread(jpgFileName);
%     gallery=cat(2,gallery,reshape(temp,[2500,1]));
% end
m=mean(gallery,2);
imgcount=size(gallery,2);
zeromean = [];
for i=1 : imgcount
    temp = double(gallery(:,i)) - m;
    zeromean = [zeromean temp];
end
cov=zeromean*transpose(zeromean);
[V,D]=eig(cov);

for i=1:size(D,2)
    lineareigen(i)=D(i,i);
end
[sortedD,sortedindex]=sort(lineareigen,'descend');
nPC=300;
pc=[];
for i=1:nPC
    pc=[pc V(:,sortedindex(i))];
end

% for pcnumber=1:10
%     plotface(pc, pcnumber);
% end
recogratio=[];
recognized=zeros(10,200);
itrindex=0;
for pcnumber=10:10:120
    projectimg=[];
    for j=1:imgcount
        temp=zeromean(:,j)'*pc(:,2:pcnumber+2);%pc(:,2:pcnumber+2)'*zeromean;
        projectimg=[projectimg temp'];
        %imagesc(projectimg(:,1));
    end
    %recognition
    testimgcount=size(probe,2);
    itrindex=itrindex+1;
    recogratio=[recogratio 0];
    for k=1:testimgcount
        meansub=double(probe(:,k))-m;
        %project
        testptojected=meansub'*pc(:,2:pcnumber+2);
        dictancefromall=zeros(1,imgcount);
        for c=1:imgcount
            disteuclidean=sqrt(sum((projectimg(:,c)-testptojected').^2));
            dictancefromall(c)=disteuclidean;
        end
        [M,I]=min(dictancefromall);
        recognized(itrindex,k)=I;
        if I==ceil(k/2)
            recogratio(itrindex)=recogratio(itrindex)+1;
        end
    end
end

%90 mai hi sara varience capture ho gaya hai

%withoutpca
nopcarecognized=zeros(1,testimgcount);
nopcarecogratio=0;
for k=1:testimgcount
        dictancefromall=zeros(1,imgcount);
        mindist=intmax;
        for c=1:imgcount
            disteuclidean=sqrt(sumsqr((double(gallery(:,c))-double(probe(:,k)))));
            dictancefromall(c)=disteuclidean;
            if (dictancefromall(c)<mindist)
                nopcarecognized(k)=c;
                mindist=dictancefromall(c);
            end
        end
        [M,I]=min(dictancefromall);
        if I==ceil(k/2)
            nopcarecogratio=nopcarecogratio+1;
        end
end
%maybe we are removing noise from data

newrecog=recogratio/2;
plot([10,20,30,40,50,60,70,80,90,100,110,120],newrecog);