img = im2double(imread('lena.jpg'));
sigma = 2.0;
hsize = 7;
scale = 5;
%% Gaussian Pyramid
I = img;
gFilter = fspecial('gaussian', hsize, sigma);
for s = 1 : scale
% Gaussian filter
    gImg = imfilter(I, gFilter);
% Save or show image
    imwrite(gImg, sprintf('Gaussian_scale%d.jpg', s));
% Down-sampling
    I = imresize(gImg, 0.5);
end

%% Laplacian Pyramid
I = img;
for s = 1 : scale
% Gaussian filtering
    gImg = imfilter(I, gFilter);
% Laplacian filtering
    lImg = I - gImg;
% Save or show image
    imwrite(lImg + 0.5, sprintf('Laplacian_scale%d.jpg',s));
% Down-sampling
    I = imresize(gImg, 0.5);
end