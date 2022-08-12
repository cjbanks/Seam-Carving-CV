function horizontalSeam = find_optimal_horizontal_seam(cumulativeEnergyMap)
    horizontalSeam = zeros(length(cumulativeEnergyMap(1, :)), 1);
    for i = length(cumulativeEnergyMap(1, :)):-1:1
        if i == length(cumulativeEnergyMap(1, :))
            [~, ind] = min(cumulativeEnergyMap(:, i));
            horizontalSeam(i) = ind;
        else
            if i > 1
                row_index = horizontalSeam(i+1);
                min_val = inf;
                fut_row_ind = row_index - 1;
                for j =1:3
                    if fut_row_ind > 0 && fut_row_ind <= length(cumulativeEnergyMap(:, 1))
                        pot_val = cumulativeEnergyMap(fut_row_ind, i);
                        past_val = cumulativeEnergyMap(row_index, i - 1) ;
                        val = past_val + pot_val;
                        if val < min_val
                            %disp("new min");
                            min_val = val;
                            horizontalSeam(i) = fut_row_ind;
                        end
                    end
                    fut_row_ind = fut_row_ind + 1;
                end
            else
                    horizontalSeam(i) = horizontalSeam(i+1);
            end
       end
    end
end
    
