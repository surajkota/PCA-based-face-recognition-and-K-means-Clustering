%clearvars;
load('gallery.mat');
load('probe.mat');
%pcnumber=100;
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
nPC=100;
pc=[];
for i=1:nPC
    pc=[pc V(:,sortedindex(i))];
end


    projectimg=[];
    for j=1:imgcount
        temp=zeromean(:,j)'*pc(:,1:pcnumber);%pc(:,1:pcnumber)'*zeromean;
        projectimg=[projectimg temp'];
        %imagesc(projectimg(:,1));
    end
    testimgcount=size(probe,2);
    for k1=1:testimgcount
        meansub=double(probe(:,k1))-m;
        %project
        testptojected=meansub'*pc(:,1:pcnumber);
        projectimg=[projectimg testptojected'];
    end
    
M=transpose(projectimg);
k=2;
Uprev=zeros(k,300);
Ucurr=zeros(k,300);
v=zeros(k,pcnumber);
r = randi([1 300],1,k);
%r=[99,53,48,81,23,50,91,58,85,74];
r=[1 74];
for m=1:k
    v(m,:)=M(r(m),:);
end

converge = false;
itr=0;
distance=zeros(k,300);
debug=0;
while 1
    itr=itr+1;
    
    for i=1:300
        %clusterindex=0;
        for j=1:k
            distance(j,i)=0;
            %prevdistance=0;
            temp1=M(i,:);
            temp2=v(j,:);
            temp=sqrt(sumsqr((M(i,:)-v(j,:))));
            distance(j,i)=temp;
%             if j==1
%                 prevdistance=distance(j,i);
%                 clusterindex=j;
%             elseif distance(j,i)<prevdistance
%                 prevdistance=distance(j,i);
%                 clusterindex=j;
%                 debug=debug+1;
%             end
        end
        [indvalue,clusterindex]=min(distance(:,i));
        for lo=1:k
            if clusterindex==lo
                Ucurr(lo,i)=1;
            else
                Ucurr(lo,i)=0;
            end
        end
    end
%     J(itr)=0;
%     for j=1:k
%         for i=1:150
%             jdistance=0;
%             if Ucurr(j,i)==1
%                 for p=1:4
%                     temp=(M(i,p)-v(j,p));
%                     jdistance=jdistance+(temp*temp);
%                 end
%                 %distance=sqrt(distance);
%             end
%             J(itr)=J(itr)+(Ucurr(j,i)*(jdistance));
%         end
%     end
    %change the mean
    for jjm=1:k
        npts=0;
        sum=zeros(1,pcnumber);
        for iim=1:300
           if Ucurr(jjm,iim)==1
               npts=npts+1;
               sum(1,:)=sum(1,:)+M(iim,:);
           end
        end
        if npts~=0
        v(jjm,:)=(sum(1,:)/npts);
        end
    end
    converge=isequal(Uprev,Ucurr);
    if converge>0
        break;
    end
    Uprev=Ucurr;
end
load('gender.mat');
gender1=table2array(gender);
nmale=0;
nfemale=0;
% for looper=1:100
%     if strcmp(gender1(looper),'male')>0
%         nmale=nmale+1;
%     else
%         nfemale=nfemale+1;
%     end
% end
%     

malefemale=zeros(2,2);
for looper=1:100
    cluster=0;
    if Ucurr(1,looper)==1
        cluster=1;
    else
        cluster=2;
    end
    if strcmp(gender1(looper),'male')>0
        malefemale(cluster,1)=malefemale(cluster,1)+1;
        nmale=nmale+1;
    else
        malefemale(cluster,2)=malefemale(cluster,2)+1;
        nfemale=nfemale+1;
    end
end
looper=0;
for looper1=101:300
    cluster=0;
    if Ucurr(1,looper1)==1
        cluster=1;
    else
        cluster=2;
    end
    looper=looper+1;
    if strcmp(gender1(ceil(looper/2)),'male')>0
        malefemale(cluster,1)=malefemale(cluster,1)+1;
    else
        malefemale(cluster,2)=malefemale(cluster,2)+1;
    end
end

%figure();
