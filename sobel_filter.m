function output = sobel_filter(img, kernel)
    img2 = zeros(size(img));

    for i = 3 : size(img2,2) -1
        for j = 3 : size(img2,1) -1
            img2(j,i) = sum(sum(kernel .* img (j-1:j+1,i-1:i+1)));
        end
    end
    
    output = img2;
end