clearvars;
for ii=1:10
    pcnumber=ii*10;
    run('silhouette.m');
    lol=ii
    iidu(ii)=silindex;
end
% hold on
%     %Jplott(i)=J;
%     plot(J);
% %plot([1,2,3,4,5,6,7,8,9,10,11],Jplot);
% xlabel('Algorithm Iterations');
% ylabel('Objective function: J ');
% title('Zoomed view of Objective function vs the number of iterations for k=3');
% %legend('k=3','k=4','k=5','k=7');
% tree=linkage(M,'average','euclidean');
% dendogram(tree,30)
% Undefined function or variable 'dendogram'.
%  
% Dendogram(tree,30)
% Undefined function or variable 'Dendogram'.
%  
% Dendrogram(tree,30)
% Cannot find an exact (case-sensitive) match for 'Dendrogram'
% 
% The closest match is: dendrogram in C:\Program
% Files\MATLAB\R2016a\toolbox\stats\stats\dendrogram.m
% 
%  
% dendrogram(tree,30)
% Warning: MATLAB has disabled some advanced graphics rendering features by switching to
% software OpenGL. For more information, click here. 
% ylabel('Average Euclidean Distance');
% title('Dendrogram of data set using unweighted, average Euclidean distance');
tree=linkage(M,'average','euclidean');
dendrogram(tree,30)
