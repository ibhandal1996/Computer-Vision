I1 = im2double(imread('einstein2.jpg'));
tempImg = im2double(imread('template.jpg'));

output = I1;
thr1 = 0.5;

shift_v = size(tempImg,1);
shift_u = size(tempImg,2);

for u = 1 + shift_u : size(I1, 2) - shift_u
    for v = 1 + shift_v : size(I1, 1) - shift_v
        x1 = u - floor(shift_u/2); 
        x2 = u + floor(shift_u/2);
        y1 = v - floor(shift_v/2);
        y2 = v + floor(shift_v/2);
        patch = I1(y1:y2, x1:x2);
        % Normalized Cross-Correlation
        temppatch = patch(:);
        temptempImg = tempImg(:);
        temppatch = temppatch - mean(temppatch);
        temppatch = temppatch/norm(temppatch);
        temptempImg = temptempImg - mean(temptempImg);
        temptempImg = temptempImg/norm(temptempImg);
        value = dot(temppatch,temptempImg);
        output(v, u) = value;
    end
end
match = (output > thr1);

imwrite(output ./ max(output(:)), 'einstein2_normcorr_output.jpg');
imwrite(match, 'einstein2_normcorr_match.jpg');

