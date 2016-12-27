function deldist = deldun(M,Ucurr,ci,cj)
%calc dis between every point in ci and cj
delarr=[];
aitr=0;
for ai=1:300
    if Ucurr(ci,ai)==1
        for aj=1:300
            if Ucurr(cj,aj)==1
                aitr=aitr+1;
                tempd=0;
%                 for p=1:4
%                 temp=(M(ai,p)-M(aj,p));
%                 tempd=tempd+(temp*temp);
%                 end
                delarr(aitr)=sqrt(sumsqr((M(ai,:)-M(aj,:))));%sqrt(tempd);
            end
        end
    end
end
deldist=min(delarr);