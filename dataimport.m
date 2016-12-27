%oned1=transpose(subject1_img1);
%ond2=oned1(:);

itr=0;
for k=1:100
    %for j=2:3
        jpgFileName = strcat('subject', num2str(k), '_img1','.pgm');
        if exist(jpgFileName, 'file')
            imageData = imread(jpgFileName);
            %imagedata1=transpose(imageData);
            itr=itr+1;
            gallery(:,itr)=imageData(:);
        else
            fprintf('File %s does not exist.\n', jpgFileName);
        end
    %end
end
save('colgallery.mat','gallery');
% itr=0;
% for k=1:100
%     for j=2:3
%         jpgFileName = strcat('subject', num2str(k), '_img',num2str(j),'.pgm');
%         if exist(jpgFileName, 'file')
%             imageData = imread(jpgFileName);
%             itr=itr+1;
%             probe(:,itr)=imageData(:);
%         else
%             fprintf('File %s does not exist.\n', jpgFileName);
%         end
%     end
% end
% A = importdata('Gender.txt'); 
% M=A.data; save('hw5.mat','M');
% T = readtable('Gender.csv')
% save('gender.mat','gender');