%clearvars;
%pcnumber=80;
run('proj2kmeans.m');
sum=0;
for purei=1:k
    sum=sum+max(malefemale(purei,:));
end
purityindex=sum/300;
