function energyImage = energy_image(im)
 im_gray = rgb2gray(im);
 [gx, gy] = imgradientxy(im_gray, 'Sobel');
 energyImage = abs(gx) + abs(gy);
end