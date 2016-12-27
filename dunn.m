%clearvars;
run('proj2kmeans.m');
%diameter of cluster
diaarr=[];
bitr=0;
for bk=1:k;
    for bi=1:300
        if Ucurr(bk,bi)==1
            for bj=1:300
                if Ucurr(bk,bj)==1
                    if bi~=bj
                        bitr=bitr+1;
                        tempd=0;
%                         for p=1:4
%                         temp=(M(bi,p)-M(bj,p));
%                         tempd=tempd+(temp*temp);
%                         end
                        diaarr(bitr)=sqrt(sumsqr((M(bi,:)-M(bj,:))));
                    end
                end
            end
        end
    end
end

maxdia=max(diaarr);
dun=zeros(k,k);
for di=1:k
    for dj=1:k
        if di~=dj
            deldij=deldun(M,Ucurr,di,dj);
            dun(di,dj)=(deldij/maxdia);
        end
    end
end
Vd=dun(1,2);
for di=1:k
    for dj=1:k
        if di~=dj
            if Vd>dun(di,dj)
                Vd=dun(di,dj);
            end
        end
    end
end
