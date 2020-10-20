function [magnitude, orientation] = sobel_feature(img)
    % horizontal edge
    Hy = [1, 2, 1; 0, 0, 0; -1, -2, -1];
    % vertical edge
    Hx = [1, 0, -1; 2, 0, -2; 1, 0, -1];
    
    %% Sobel filtering
    filtImg = imfilter(img, Hy);
    filtImg2 = imfilter(img, Hx);
    
    graImg1 = zeros(size(img));
    graImg2 = zeros(size(img));
    
    for i = 1 : size(img,2)
        for j = 1 : size(img,1)
            graImg1(j,i) = sqrt((filtImg(j,i) * filtImg(j,i)) + (filtImg2(j,i) * filtImg2(j,i)));
            graImg2(j,i) = atan((filtImg(j,i))/(filtImg2(j,i)));
        end
    end
    
    %% compute gradient magnitude and orientation
    magnitude = graImg1;
    orientation = graImg2;
end