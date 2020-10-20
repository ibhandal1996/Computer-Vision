function output = median_filter(img, patch_size)
    I2 = zeros(size(img));
    
    if patch_size == 3
        shift = 1;
    elseif patch_size == 5
        shift = 2;
    end
    
    for u = 1 +shift:size(img,2) - shift
        for v = 1 +shift:size(img,1) - shift
            x1 = u - shift;
            x2 = u + shift;
            y1 = v - shift;
            y2 = v + shift;
            patch = img(y1:y2, x1:x2);
            patch = patch(:);
            value = median(patch);
            I2(v,u) = value;
        end
    end
    output = I2;
end