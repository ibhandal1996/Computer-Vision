I1 = im2double(imread('einstein1.jpg'));
tempImg = im2double(imread('template.jpg'));

output = I1;
thr1 = 25;
thr2 = 45;

shift_v = size(tempImg,1);
shift_u = size(tempImg,2);

for u = 1 + shift_u : size(I1, 2) - shift_u
    for v = 1 + shift_v : size(I1, 1) - shift_v
        x1 = u - floor(shift_u/2); 
        x2 = u + floor(shift_u/2);
        y1 = v - floor(shift_v/2);
        y2 = v + floor(shift_v/2);
        patch = I1(y1:y2, x1:x2);
        % SSD
        value = patch- tempImg;
        value = value.^2;
        value = sum(sum(value));
        output(v, u) = value;
    end
end

match = (output < thr1);

imwrite(output ./ max(output(:)), 'einstein1_ssd_output.jpg');
imwrite(match, 'einstein1_ssd_match.jpg');

