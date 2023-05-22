% Ballistic Deposition with Surface Relaxation
% can also be applied to correlated ballistic deposition model
% Bronagh Campbell - 5th May 2023

N = 200;           % Surface length
t_max = 100000;    % deposition time
relax_time = t_max; % Time to initiate surface relaxation

% creating initial surface
surface = zeros(1, N);

% ballistic deposition
for t = 1:t_max
    % generating random integer 1-200 
    x = round(rand*199)+1;
    if x == 1
        surface(x) = max(surface(x)+1, surface(x+1));
    elseif x == N
        surface(x) = max(surface(x-1), surface(x)+1);
    else
        temp_max = max(surface(x-1), surface(x+1));
        surface(x) = max(temp_max, surface(x)+1);
    end
    
    % Surface relaxation
    if t == relax_time
        for i = 1:N
            % Find the minimum height of the nearest neighbours
            if i == 1
                neighbours = [surface(i)+1, surface(i+1)];
            elseif i == N
                neighbours = [surface(i-1), surface(i)+1];
            else
                neighbours = [surface(i-1), surface(i+1)];
            end
            min_neighbour_height = min(neighbours);
            % Update the height of the surface
            if surface(i) > min_neighbour_height
                 surface(i) = surface(i)-1;
                 min_neighbour_height=min_neighbour_height+1;

            else
                surface(i)=surface(i);
            end
        
        end
     end
    

end

plot(surface);
xlabel('Surface Length');
ylabel('Height');
title('Ballistic Deposition with Surface Relaxation');
