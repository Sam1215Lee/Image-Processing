% Written by Pratik Jain
% Subscribe me on YouTube
% https://www.youtube.com/PratikJainTutorials


clc
clear 
close all
%% Read the images in a Folder

selpath = uigetdir;             % Opens a Browser to selec the folder in which the images are placed
if selpath==0
    return
end
files = dir(selpath);
p = length(files);
s = 1;

% This for loop reads all the images in the folder
for sf = 1:p
    if files(sf).isdir == 0
    a = imread(fullfile(files(sf).folder,files(sf).name));
    a1 = reshape(a,size(a,1)*size(a,2),size(a,3));
    images(:,:,s) = double(a1);
    s = s+1;
    end
end

%% K-means

k = 6;          % Select the no. of K for k-means

% Here k-means is performed on all the images in the folder
for i = 1:size(images,3)
    
    [idx,C] = kmeans(images(:,:,i),k);      % Inbuilt k-means function
    
    idx_images(:,i) = idx;                  % here the idx of the ith image is stored
    C_images(:,:,i) = C;                    % here the cluster centers of ith image is stored
    
    out_images(:,:,:,i) = uint8(reshape(C(idx,:),[size(a,1),size(a,2),size(a,3)])); % Here all the segmented images are stored

end

montage(out_images)                         % to see all the segmented outputs together

%% Or to see a movie of all the images

implay(out_images,1)