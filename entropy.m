%clearvars;
%pcnumber=100;
run('proj2kmeans.m');
nj=zeros(1,k);
EtropyH=zeros(1,k);
for entropyi=1:k
    EtropyH(entropyi)=0;
    for entropyj=1:2
        entropytemp=log2(malefemale(entropyi,entropyj));
        entropytemp=malefemale(entropyi,entropyj)*entropytemp;
        EtropyH(entropyi)=EtropyH(entropyi)+entropytemp;
        nj(entropyi)=nj(entropyi)+malefemale(entropyi,entropyj);
    end
    
end

etropyindex=0;
for entropyi=1:k
    etropyindex=etropyindex+((nj(entropyi)/300)*EtropyH(entropyi));
end