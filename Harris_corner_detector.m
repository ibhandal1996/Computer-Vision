function [corner_x, corner_y] = Harris_corner_detector(I, G1, G2, alpha, R_threshold)
    
    h1 = 1 + 2 * ceil(G1 * 2);
    h2 = 1 + 2 * ceil(G2 * 2);
    g1 = fspecial('gaussian', h1, G1);
    g2 = fspecial('gaussian', h2, G2);
    Dy = [1; 0; -1];
    Dx = [1, 0, -1];
    
    Iy = imfilter(imfilter(I, g1, 'replicate'), Dy, 'replicate');
    Ix = imfilter(imfilter(I, g1, 'replicate'), Dx, 'replicate');
    imshow(Iy + 0.5);
    imshow(Ix + 0.5);
    imwrite(Iy, 'Iy.png')
    imwrite(Ix, 'Ix.png')
    Iyy = Iy .* Iy;
    Ixx = Ix .* Ix;
    Ixy = Ix .* Iy;
    
    Syy = imfilter(Iyy, g2, 'replicate');
    Sxx = imfilter(Ixx, g2, 'replicate');
    Sxy = imfilter(Ixy, g2, 'replicate');
    det = (Syy .* Sxx) - (Sxy .* Sxy);
    M = Syy + Sxx;
    
    R = det - (alpha*(M.^2));
    imagesc(R); colormap jet; colorbar; axis image;
    corner_res = gcf; saveas(corner_res, 'Corner Response.png');
    
    corner_res2 = R > R_threshold;
    imwrite(corner_res2, 'Corner Response2.png')
    
    Local_Maxima = imregionalmax(R);
    imwrite(Local_Maxima, 'Local_Maxima.png')

    final_corner_map = (corner_res2 & Local_Maxima);
    imwrite(final_corner_map, 'final_corner_map.png')
    [corner_y, corner_x] = find(final_corner_map);

end

