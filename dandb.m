%clearvars;
run('withoutpcakmeans.m');
distwithin=zeros(1,k);
for ri=1:k
    distwithin(ri)=withinc(M,v,Ucurr,ri);
end

distbetw=zeros(k,k);
for ri=1:k
    for rj=1:k
        if ri~=rj
        distbetw(ri,rj)=betweenc(v,ri,rj);
        end
    end
end
dnbindex=0;
jvalue=zeros(1,k);
for rj=1:k
    ritr=0;
    for ri=1:k
        if rj~=ri
            ritr=ritr+1;
            jvalue(ritr)=(distwithin(ri)+distwithin(rj))/(distbetw(rj,ri));
        end
    end
    dnbindex=dnbindex+max(jvalue);
end
dnbindex=dnbindex/k;