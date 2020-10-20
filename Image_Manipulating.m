I1 = imread('01.jpg');
I2 = zeros(300, 400, 3, 'uint8');
for y1 = 1 : 300
    for x1 = 1 : 400
       y2 = (y1 - 150) * cosd(60) + (x1 - 200) * sind(60);
       x2 = -(y1 - 150) * sind(60) + (x1 - 200 ) * cosd(60);
       y2 = round(y2) + 150;
       x2 = round(x2) + 200;
       if( 1 <= y2 && y2 <= 300 && 1 <= x2 && x2 <= 400 )
        I2(y2, x2, :) = I1(y1, x1, :);
       end
    end
end
imwrite(I2, 'rotate_0.jpg');

I2 = zeros(300, 400, 3, 'uint8');
for y1 = 1 : 300
    for x1 = 1 : 400
       y2 = (y1 - 150) * cosd(60) - (x1 - 200) * sind(60);
       x2 = (y1 - 150) * sind(60) + (x1 - 200 ) * cosd(60);
       y2 = round(y2) + 150;
       x2 = round(x2) + 200;
       if( 1 <= y2 && y2 <= 300 && 1 <= x2 && x2 <= 400 )
        I2(y2, x2, :) = I1(y1, x1, :);
       end
    end
end
imwrite(I2, 'rotate_1.jpg');

img = im2double(imread('lena_noisy.jpg'));
patch_size = [3,3];
%patch_size = [5,5];

img_median = median_filter(img, patch_size);
imwrite(img_median, 'median_0.jpg');