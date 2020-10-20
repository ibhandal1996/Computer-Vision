r1 = .1;
r2 = .2;

i = im2double(imread('lena.jpg'));

[lpi1,hpi1] = separate_frequency(i,r1);
[lpi2,hpi2] = separate_frequency(i,r2);

imwrite(lpi1, 'lena_low_0.1.jpg');
imwrite(hpi1 +.5, 'lena_high_0.1.jpg');
imwrite(lpi2, 'lena_low_0.2.jpg');
imwrite(hpi2 +.5, 'lena_high_0.2.jpg');

i1 = im2double(imread('marilyn.jpg'));
i2 = im2double(imread('einstein.jpg'));

r3 = 0.2;

hybrid1 = hybrid_image(i1,i2,r3);
hybrid2 = hybrid_image(i2,i1,r3);

imwrite(hybrid1, 'hybrid_1.jpg');
imwrite(hybrid2, 'hybrid_2.jpg');

i3 = im2double(imread('new_york.jpg'));
i4 = im2double(imread('flowers.jpg'));

j = 1;
visualization(i3,j);
j = 2;
visualization(i4,j);