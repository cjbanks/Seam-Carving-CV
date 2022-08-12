function SeamCarvingReduceHeight(im)
energyIm = energy_image(im);
for i = 1:100
    fprintf("iteration %d \n",i);
    %cumulative_en_im = cumulative_minimum_energy_map(energyIm, 'VERTICAL');
    %vertSeam = find_optimal_vertical_seam(cumulative_en_im);
    [im, energyIm] = reduceHeight(im, energyIm);
end
imwrite(im, "output_face_height.png")
end