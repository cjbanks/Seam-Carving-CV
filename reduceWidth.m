function [reducedColorImage,reducedEnergyImage] = reduceWidth(im, energyImage)
    cumu_im_map = cumulative_minimum_energy_map(energyImage, 'VERTICAL');
    vert_seam = find_optimal_vertical_seam(cumu_im_map);
    %displaySeam(im, vert_seam, 'VERTICAL')
    copy_im = zeros(length(im(:, 1, 1)), length(im(1, :, 1))-1, length(im(1, 1, :)));
    copy_en = zeros(length(im(:,1,1)), length(im(1, :, 1))-1);
    for i = 1:length(im(:, 1, 1))
            j = vert_seam(i);
            im(i, j, :);   
            cop = cat(2, im(i, 1:j-1, :), im(i, j+1:end, :));
            en = cat(2, energyImage(i, 1:j-1), energyImage(i, j+1:end));
            if i ==1
                copy_im = cop;
                copy_en = en;
            else
            copy_im = cat(1, copy_im, cop);
            copy_en = cat(1, copy_en, en);
            end
    end
    
        %copy_im = cat(2, im(10, 1:5,:), im(10, 6:end-1, :));

        reducedColorImage = copy_im;
        reducedEnergyImage = copy_en; 
end
