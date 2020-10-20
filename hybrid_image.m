function img_merged = hybrid_image(img1, img2, ratio)
    %% split img1 and img2 into low/high frequency
    [l1,h1] = separate_frequency(img1,ratio);
    [l2,h2] = separate_frequency(img2,ratio);
    
    %% combine the low-frequency map of img1 with the
    img_merged = l1 + h2;

end