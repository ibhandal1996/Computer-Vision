img = imread('hill.png');
img1 = imread('lines.png');
img2 = imread('bridge.png');

edge_map = edge(rgb2gray(img), 'canny', 0.1, 3);
edge_map1 = edge(rgb2gray(img1), 'canny', 0.1, 3);
edge_map2 = edge(rgb2gray(img2), 'canny', 0.1, 3);

figure;
[m1, b1] = hough_transform(edge_map1);
x1 = 1:size(img1,2);
y1 =(m1*x1)+b1;
subplot (2,1,1); imshow(img1); hold on; plot(x1, y1, 'LineWidth', 3, 'Color', 'red');
saveas(gcf, 'line_mb_line.png');

figure;
[r1, theta1] = hough_transform_polar(edge_map1);
xp1 = 1:size(img1,2);
yp1 = ((-cos(theta1)/sin(theta1))*x1) + (r1/sin(theta1));
subplot (2,1,1); imshow(img1); hold on; plot(x1, y1, 'LineWidth', 3, 'Color', 'blue');
saveas(gcf, 'line_polar_line.png');

figure;
[m, b] = hough_transform(edge_map);
x = 1:size(img,2);
y =(m*x)+b;
subplot (2,1,1); imshow(img); hold on; plot(x, y, 'LineWidth', 3, 'Color', 'red');
saveas(gcf, 'hill_mb_line.png');

figure;
[r, theta] = hough_transform_polar(edge_map);
xp = 1:size(img,2);
yp = ((-cos(theta)/sin(theta))*x) + (r/sin(theta));
subplot (2,1,1); imshow(img); hold on; plot(x, y, 'LineWidth', 3, 'Color', 'blue');
saveas(gcf, 'hill_polar_line.png');

figure;
[m2, b2] = hough_transform(edge_map2);
x2 = 1:size(img2,2);
y2 =(m2*x2)+b2;
subplot (2,1,1); imshow(img2); hold on; plot(x2, y2, 'LineWidth', 3, 'Color', 'red');
saveas(gcf, 'bridge_mb_line.png');

figure;
[r2, theta2] = hough_transform_polar(edge_map2);
xp2 = 1:size(img2,2);
yp2 = ((-cos(theta2)/sin(theta2))*x2) + (r2/sin(theta2));
subplot (2,1,1); imshow(img2); hold on; plot(x2, y2, 'LineWidth', 3, 'Color', 'blue');
saveas(gcf, 'bridge_polar_line.png');