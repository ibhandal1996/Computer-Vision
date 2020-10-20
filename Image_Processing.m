I = imread("01.jpg");
I(1,1)
I1 = im2double(I);
I1(1,1)
I2 = I;
I2(:,:,2) = 0;
%imshow(I2)

imwrite(I2, "green.jpg");
Y= I(:,:,1)*(0.299) + I(:,:,2)*(0.587) + I(:,:,3)*(0.114);
%imshow(Y)
I90 = imrotate(I,90);
%imshow(I90)

imwrite(Y, "grey.jpg");
imwrite(I90, "rotate.jpg");
dogI = imread("01.jpg");
dogI2 = dogI(1:300,50:350,:);
dogI23 = dogI(30:270,100:300,:);
%imshow(dogI2)
%imshow(dogI23)
imwrite(dogI23, "crop.jpg");
dogFlip = flip(dogI,2);
%imshow(dogFlip)
imwrite(dogFlip, "flip.jpg");
Im1=imread("01.jpg");
Im2=imread("02.jpg");
Im3=imread("03.jpg");
Im4=imread("04.jpg");
stitchIm = (zeros(300 * 2 + 10, 400 * 2 + 10, 3, 'uint8'));
stitchIm(1:300,1:400, :) = Im1;
stitchIm(301:600,1:400, :) = Im2;
stitchIm(1:300,401:800, :) = Im3;
stitchIm(301:600,401:800, :) = Im4;
%imshow(stitchIm)
imwrite(stitchIm, "combine.jpg");
Im5=imread('05.jpg');
Im6=imread('06.jpg');
Im8 = Im6(:);
Im7 = Im5(:);
Im9 = (Im8(:)+Im7(:))/2;
Im10=reshape(Im9(:), 375, 1242, 3);
imwrite(Im10, "average.jpg");




