fileFolder = fullfile('M:','Documents','NewMATLAB','proj2','GallerySet');
dirOutput = dir(fullfile(fileFolder,'*.pgm'));
fileNames = {dirOutput.name}'
montage(fileNames);