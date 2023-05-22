% Random Deposition – 2+1D
% Bronagh Campbell – 7th Feb. 2023

% create initial surface
surface = zeros(250,250);
 
% particles to be deposited
no_particles = 100000;
 
for i = 1:no_particles
    
  % generating a random integer 1-250
   x = round(rand*249)+1;
   y = round(rand*249)+1;
   
   % incrementing surface height 
   surface(x,y)=surface(x,y)+1;
   
hold on
     surf(surface,'EdgeColor',[0.4660 0.6740 0.1880]);
     view(3);
     title('Random Deposition 2+1D');
     xlabel('Surface');
     ylabel('Surface');
     zlabel('Surface Height');

end

hold off

   
   
