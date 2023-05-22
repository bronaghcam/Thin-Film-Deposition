% Random Deposition Average Surface Height
% can be used for any of the other deposition models
% Bronagh Campbell – 27th Jan. 2023
% create initial surface
surface = zeros(1, 200);
vals=[];    % used to store values for average surface height
 
% particles to be deposited
no_particles = 100000;
 
for i = 1:no_particles
    
    % generating a random integer 1-100
    x = round(rand*199)+1;
    
   % incrementing surface height 
   surface(x)=surface(x)+1;
   
   % calculating average surface height after each iteration
   vals(1,length(vals)+1)=mean(surface);  
   
end


j=1:100000;
plot(j,vals(1,:));

title('Average Surface Height - Random Deposition 1+1D'); 
xlabel('Time Steps'); 
ylabel('Surface Height'); 
hold off

