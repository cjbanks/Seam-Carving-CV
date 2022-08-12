function [reducedColorImage,reducedEnergyImage] = reduceHeight(im, energyImage)
cum_im_map = cumulative_minimum_energy_map(energyImage, 'HORIZONTAL');
horiz_seam = find_optimal_horizontal_seam(cum_im_map);
copy_im = zeros(length(im(:, 1, 1))-1, length(im(1, :, 1)), length(im(1, 1, :)));
copy_en = zeros(length(im(:, 1, 1))-1, length(im(1, :, 1)));
for j = 1:length(im(1, :, 1))
    i = horiz_seam(j);
    size(horiz_seam);
    cop = cat(1, im(1:i-1, j, :), im(i+1:end, j, :));
    en = cat(1, energyImage(1:i-1, j), energyImage(i+1:end, j));
    if j == 1
        copy_im = cop;
        copy_en = en;
    else
        copy_im = cat(2, copy_im, cop);
        copy_en = cat(2, copy_en, en);
    end
    reducedColorImage = copy_im;
    reducedEnergyImage = copy_en;
end
