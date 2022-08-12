function cummulative_energy_map = cumulative_minimum_energy_map(energyImage, seamDirection)
    cm_map = zeros(size(energyImage));
if strcmp(seamDirection, 'HORIZONTAL')
    cm_map(:, 1) = energyImage(:, 1);
    for i = 1:length(energyImage(:, 1))-1  
        for j = 2:length(energyImage(1, 2:end))
            if i == 1
               cm_map(i, j) = energyImage(i, j) + min([cm_map(i, j-1), cm_map(i, j-1), cm_map(i+1, j-1)]);     
            elseif i == length(energyImage(i, :))
               cm_map(i, j) = energyImage(i, j) + min([cm_map(i-1, j-1), cm_map(i, j-1), cm_map(i, j-1)]);
            else
                cm_map(i, j) = energyImage(i, j) + min([cm_map(i-1, j-1), cm_map(i, j-1), cm_map(i+1, j-1)]);
            end
            
        end
    end   
    cummulative_energy_map = cm_map;           
elseif strcmp(seamDirection, 'VERTICAL')
    cm_map(1, :) = energyImage(1, :);
    for i = 2:length(energyImage(2:end, 1))
        for j = 1:length(energyImage(i, :))
            if j == 1
               cm_map(i, j) = energyImage(i, j) + min([cm_map(i-1, j), cm_map(i-1, j), cm_map(i-1, j+1)]);     
            elseif j == length(energyImage(i, :))
               cm_map(i, j) = energyImage(i, j) + min([cm_map(i-1, j-1), cm_map(i-1, j), cm_map(i-1, j)]);
            else
                cm_map(i, j) = energyImage(i, j) + min([cm_map(i-1, j-1), cm_map(i-1, j), cm_map(i-1, j+1)]);
            end
            
        end
    end   
    cummulative_energy_map = cm_map;
else
    disp("use HORIZONTAL or VERTICAL");
        
end

end
