function copy_im = displaySeam(im,seam, type)
copy_im = im;
    if strcmp(type, 'VERTICAL')
        for i = 1:length(im(:, 1, 1))
            copy_im(i, seam(i), :) = [255, 0, 0];
        end
        %imshow(copy_im)
    elseif strcmp(type, 'HORIZONTAL')
            for i = 1:length(im(1, :, 1))
                copy_im(seam(i),i, :) = [255, 0, 0];
            end  
            %imshow(copy_im)
    else
          %disp('WRONG INPUT')  
    end         
end