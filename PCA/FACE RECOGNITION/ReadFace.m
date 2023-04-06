function Training_Data = ReadFace(Training_Path)
flist = dir(strcat(Training_Path,'\*.jpg'));
Training_Data = [];
for imidx = 1:length(flist)
    fprintf('Constructing Training Image Data Space [%d] \n', imidx); 
    path = strcat(Training_Path,strcat('\',int2str(imidx),'.jpg'));
    img = imread(path);
    [irow icol] = size(img);
    temp = reshape(img',irow*icol,1);   
    Training_Data = [Training_Data temp];
end
fprintf('\n');