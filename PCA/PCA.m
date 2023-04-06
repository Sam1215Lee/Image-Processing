clc
clear
close


img = imread('lenna.png');
figure(1);

subplot(1,2,1);
imshow(img);
title('Original');

shape = size(img);
U = zeros(shape);
S = zeros(shape);
V = zeros(shape);
for i = 1:3
    [U(:,:,i),S(:,:,i),V(:,:,i)] = svd(im2double(img(:,:,i)));
end

Ug = zeros(shape);
Sg = zeros(shape);
Vgt = zeros(shape);
Vt = zeros(shape);
for i = 1:3
    Vt(:,:,i) = V(:,:,i)';
end


N = 512;
for p = 1:N
    regenerated_img = zeros(shape);

    for i = 1:3
        Ug(:, 1:p, i) = U(:, 1:p, i);
        Sg(1:p, 1:p, i) = S(1:p, 1:p, i);     
        Vgt(1:p, :, i) = Vt(1:p, :, i);
        regenerated_img(:,:,i) = Ug(:,:,i) * Sg(:,:,i) * Vgt(:,:,i);
    end
    
    imwrite(regenerated_img,sprintf('PCA_rgb_lenna_%d.png', p),'png');
end


% Extract the individual color channels
redChannel = img(:,:,1);
greenChannel = img(:,:,2);
blueChannel = img(:,:,3);

% Combine the color channels to form the true-color image
trueColorImg = cat(3, redChannel, greenChannel, blueChannel);

% Display the true-color image
imshow(trueColorImg);

% Optional: add a title to the figure
title('RGB True-Color Composition');
