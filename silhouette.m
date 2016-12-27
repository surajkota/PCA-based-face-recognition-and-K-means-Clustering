%clearvars;
%pcnumber=100;
run('proj2kmeans.m');
spoints=zeros(1,300);
silinj=zeros(1,k);
thispoint=zeros(1,300);
notthispoint=zeros(1,300);
for sili=1:300
    [tmep, silicluster]=max(Ucurr(:,sili));
    thispoint(sili)=silicluster;
    if silicluster==1
        noto=2;
    else
        noto=1;
    end
    notthispoint(sili)=noto;
    silinj(silicluster)=silinj(silicluster)+1;
end
silisum=0;
for sili=1:300
    %calc a
    a=0;
    for silij=1:300
        if sili~=silij
            if Ucurr(thispoint(sili),silij)==1
                a=a+sqrt(sumsqr((M(sili,:)-M(silij,:))));
            end
        end
    end
    
    a=a/silinj(thispoint(sili));
    b=0;
    for silij=1:300
        if sili~=silij
            if Ucurr(thispoint(sili),silij)~=1
                b=b+sqrt(sumsqr((M(sili,:)-M(silij,:))));
            end
        end
    end
    b=b/silinj(notthispoint(sili));
    silimax=0;
    if b>a
        silimax=b;
    else
        silimax=a;
    end
    spoints(sili)=(b-a)/(silimax);
    silisum=silisum+spoints(sili);
end
silindex=silisum/300;