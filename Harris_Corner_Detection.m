G1 = 1;
G2 = 2;
alpha = 0.04;
R_threshold = 1e-5 * 5;

%I = im2double(imread(sprintf('baboon.png')));
%I = im2double(imread(sprintf('checkboard.png')));
I = im2double(imread(sprintf('cameraman.png')));

[corner_x, corner_y] = Harris_corner_detector(I, G1, G2, alpha, R_threshold);

%% visualize results
figure, imshow(I); hold on;
plot(corner_x, corner_y, 'ro');

result = gcf; saveas(result, 'results.png');
