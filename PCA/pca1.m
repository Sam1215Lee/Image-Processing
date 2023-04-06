clear all
close all
clc

m = 100; 
n = 10; 
A = randn(m, n);
r = 4; 
[U, S, V] = svd(A);
U = U(:, 1:r);
S = S(1:r, 1:r);
V = V(:, 1:r);
B = U * S * V';
r1 = rank(A);
r2 = rank(B);



[coeff,score,latent] = pca(B, 'NumComponents', 4);
original = bsxfun(@minus, B, mean(B))*coeff;

figure;
axis equal;
plot(coeff,'DisplayName','coeff');

Err = score - original;
figure;
imagesc(Err);
colorbar;
