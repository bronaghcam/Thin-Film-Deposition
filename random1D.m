% Random Deposition – 1+1 D
% 27th Jan. 2023
% Create initial surface
surface = zeros (1, 500);
 
% particles to be deposited
no_particles = 100000;
 
for i = 1:no_particles
    
    % generating a random integer 1-100
    x = round(rand*499) +1;
    
    % incrementing surface height 
    surface(x) = surface(x) + 1;
 
    hold on
    plot(surface,'go','MarkerFaceColor','g');
    title ('Random Deposition 1+1D');
    xlabel('Length of Surface');
    ylabel('Height');
 
end
hold off
