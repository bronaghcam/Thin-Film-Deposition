% Ballistic Deposition 2+1D
% Bronagh Campbell - Apr. 5th 2023
no_particles = 5000; % number of particles to deposit

%creating initial surface
surface = zeros(75,75); % surface

for i = 1:no_particles
    % generating random integers 1-75
    x = round(rand*74)+1; 
    y = round(rand*74)+1; 
 
        if x == 1 % left boundary
            if y == 1 % bottom-left corner
                hx = max(surface(x+1,y), -inf);
                hy = max(surface(x,y+1), -inf);
                hxy = max(surface(x+1,y+1), -inf);
            elseif y == 75 % top-left corner
                hx = max(surface(x+1,y), -inf);
                hy = max(surface(x,y-1), -inf);
                hxy = max(surface(x+1,y-1), -inf);
            else % left edge
                hx = max(surface(x+1,y), -inf);
                hy = max(surface(x,y-1), surface(x,y+1));
                tempxy=max(surface(x+1,y-1), surface(x+1,y+1));
                hxy = max(tempxy, -inf);
            end
        elseif x == 75 % right boundary
            if y == 1 % bottom-right corner
                hx = max(surface(x-1,y), -inf);
                hy = max(surface(x,y+1), -inf);
                hxy = max(surface(x-1,y+1), -inf);
            elseif y == 75 % top-right corner
                hx = max(surface(x-1,y), -inf);
                hy = max(surface(x,y-1), -inf);
                hxy = max(surface(x-1,y-1), -inf);
            else % right edge
                hx = max(surface(x-1,y), -inf);
                hy = max(surface(x,y-1), surface(x,y+1));
                tempxy1=max(surface(x-1,y-1), surface(x-1,y+1));
                hxy = max(tempxy1, -inf);
            end
        elseif y == 1 % bottom edge 
            temphx=max(surface(x-1,y), surface(x+1,y));
            hx = max(temphx, -inf);
            hy = max(surface(x,y+1), -inf);
            tempxy2=max(surface(x-1,y+1), surface(x+1,y+1));
            hxy = max(tempxy2, -inf);
        elseif y == 75 % top edge
            temphx1=max(surface(x-1,y), surface(x+1,y));
            hx = max(temphx1, -inf);
            hy = max(surface(x,y-1), -inf);
            tempxy3=max(surface(x-1,y-1), surface(x+1,y-1));
            hxy = max(tempxy3, -inf);
        else % inside
            temp_hx=max(surface(x-1,y), surface(x+1,y));
            hx = max(temp_hx, surface(x,y));
            temp_hy=max(surface(x,y-1), surface(x,y+1));
            hy = max(temp_hy, surface(x,y));
            temp_xy1=max(surface(x-1,y-1), surface(x+1,y+1));
            temp_xy2=max(surface(x-1,y+1), surface(x+1,y-1));
            hxy = max(temp_xy1, temp_xy2);
        end
        surface(x,y) = max([hx, hy, hxy]) + 1; 
         hold on
         surf(surface);
         view(3);
         colormap spring

end


title('Ballistic Deposition 2+1D');
xlabel('Surface');
ylabel('Surface');
zlabel('Height');

 hold off


