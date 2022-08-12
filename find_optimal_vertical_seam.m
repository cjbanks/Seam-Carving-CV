function verticalSeam = find_optimal_vertical_seam(cumulativeEnergyMap)
    verticalSeam = zeros(length(cumulativeEnergyMap(:, 1)), 1);
    for i = length(cumulativeEnergyMap(:, 1)):-1:1
        if i == length(cumulativeEnergyMap(:,1))
            [~, ind] = min(cumulativeEnergyMap(i, :));
            verticalSeam(i) = ind;

        else
            if i > 1
                col_index = verticalSeam(i+1);
                min_val = inf;
                fut_col_ind = col_index - 1;
                for j = 1:3
                    if fut_col_ind > 0 && fut_col_ind <= length(cumulativeEnergyMap(1, :))
                        pot_val = cumulativeEnergyMap(i, fut_col_ind);
                        past_val = cumulativeEnergyMap(i-1, col_index);
                        val = past_val + pot_val;
                        if val < min_val
                            min_val = val;
                            verticalSeam(i) = fut_col_ind;
                        end         
                    end
                    fut_col_ind = fut_col_ind + 1;
                    
                end    
            else
                verticalSeam(i) = verticalSeam(i+1);   
            end
            
        end        
    end
end
