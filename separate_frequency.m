function [low_pass_img, high_pass_img] = separate_frequency(img,ratio)

    %% apply FFT
    frequency_map = fft2(img);





    %% shift the frequency map
    sfm = fftshift(frequency_map);


    %% compute low-frequency mask
    mfm = zeros(size(img));
    h= size(img, 1);
    w= size(img,2);
    
    hr = ratio .* h;
    wr = ratio .* w;
    
    x1 = round((h/2) - hr);
    x2 = round((h/2) + hr);
    y1 = round((w/2) - wr);
    y2 = round((w/2) + wr);

    %mask(((round((w/2)-(w*ratio))):(round((w/2)+(w*ratio)))),((round((h/2)-(h*ratio))):(round((h/2)+(h*ratio)))),:) = 1;
    mfm(y1:y2,x1:x2, :) = 1;
    



    %% separate low-frequency and high-frequency maps
    lsfm = sfm .* mfm;
    hsfm = sfm .* (1-mfm);



    %% shift frequency maps back
    lfm = ifftshift(lsfm);
    hfm = ifftshift(hsfm);



    %% apply Inverse FFT
    low_pass_img = real(ifft2(lfm));
    high_pass_img = real(ifft2(hfm));


end
