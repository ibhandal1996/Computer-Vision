function output = gaussian_filter(img, hsize, sigma)
    H = fspecial('gaussian', hsize, sigma);
    img2 = zeros(size(img));
   
    for i = 1 : size(img2, 2)
        for j = 1 : size(img2, 1)
            if(i <= size(img2, 1) - hsize && j <= size(img2, 2) - hsize)
                img2(j, i) = sum(sum(H.* img(j:j + hsize - 1, i : i + hsize - 1)));
            else
                img2(j, i) = img(j, i);
            end
        end
    end
    
    output = img2;
end