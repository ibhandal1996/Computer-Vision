function visualization(i,j)
    fm = fftshift(fft2(i));
    

    figure, imagesc(log(abs(fm)+ 1)), colormap jet;
    
    if j ==1
        saveas(gcf, 'new_york_frequency.jpg');
    elseif j ==2
        saveas(gcf, 'flowers_ frequency.jpg');
    end
    
end