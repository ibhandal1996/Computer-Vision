img = im2double(imread('lena.jpg'));
H = [1, 2, 1; 0, 0, 0; -1, -2, -1]; % horizontal edge%
H1 = [1, 0, -1; 2, 0, -2; 1, 0, -1]; % vertical edge
Hrc1= [1 2 1; 1 2 1; 1 2 1];
Hrc2=[1 0 -1];
Hcr1=[1 0 -1; 1 0 -1; 1 0 -1];
Hcr2=[1 2 1];
sobel_y = sobel_filter(img, H);
sobel_x = sobel_filter(img, H1);
sobel_cr = sobel_filter(img, Hcr1);
sobel_cr = sobel_filter(sobel_cr, Hcr2);
sobel_rc = sobel_filter(img, Hrc1);
sobel_rc = sobel_filter(sobel_rc, Hrc2);

imwrite(sobel_y, 'sobel_y.jpg');
imwrite(sobel_x, 'sobel_x.jpg');
imwrite(sobel_cr, 'sobel_cr.jpg');
imwrite(sobel_rc, 'sobel_rc.jpg');

hsize = 5; sigma = 2;
hsize1 = 9; sigma = 4;

gaussian_5 = gaussian_filter(img, hsize, sigma);
gaussian_9 = gaussian_filter(img, hsize1, sigma);

imwrite(gaussian_5, 'gaussian_5.jpg');
imwrite(gaussian_9, 'gaussian_9.jpg');