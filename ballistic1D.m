
% Ballistic Deposition 1+1 D
% Bronagh Campbell - 27th Jan. 2023
% create initial surface
surface = zeros(1, 200);

% partciles to be deposited
no_particles = 100000;

for i = 1:no_particles
    
    % genearting a random integer 1-100
    x = round(rand*199)+1;
    %y = round(rand*98)+2;
    
    % incrementing surface height 
    if x==1
    surface(x)=max(surface(x)+1,surface(x+1));
    elseif x==200
    surface(x)=max(surface(x-1),surface(x)+1);   
    else
    temp_max = max(surface(x-1),surface(x+1));
                surface(x) = max(temp_max,surface(x)+1);
    end

    hold on
    plot(surface,'b*');
    title('Ballistic Deposition 1+1D');
    xlabel('Length of Surface');
    ylabel('Height');
end
    hold off

