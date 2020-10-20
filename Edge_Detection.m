img = im2double(imread('lena.jpg'));
%% compute gradient magnitude and orientation with Sobel filter
[magnitude, orientation] = sobel_feature(img);

figure, imshow(magnitude);
figure, imshow(orientation);
figure, imagesc(orientation); colormap jet; axis image; colorbar;

figsave = gcf; saveas(figsave, 'sobel_ori1.jpg');
imwrite(magnitude, 'sobel_mag.jpg');
imwrite(orientation, 'sobel_ori.jpg');
%% apply thresholding to detect edge
threshold = 0.3;
e = magnitude > threshold;
figure, imshow(e);


%% use built-in function to detect edge
e1 = edge(img,'Sobel'); % change img to sobel edge detection
e2 = edge(img,'Canny'); % change img to canny edge detection
figure, imshow(img);
figure, imshow(e1); title('Sobel Edge');
figure, imshow(e2); title('Canny Edge');

imwrite(e1, 'sobel_edge.jpg');
imwrite(e2, 'canny_edge.jpg');