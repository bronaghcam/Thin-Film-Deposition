% Random Deposition Surface Roughness
% can be used for any of the other deposition models
% Bronagh Campbell – 15th Feb. 2023
% create initial surface
surface = zeros(1, 200);
vals=[];        % used to store values for roughness
 
% particles to be deposited
no_particles = 100000;
 
for i = 1:no_particles
    
    % generating a random integer 1-100
    x = round(rand*199)+1;
    
    % incrementing surface height 
    surface(x)=surface(x)+1;
  
    % calculating roughness after each iteration
    vals(1,length(vals)+1)= sqrt((1/(200))*sum((surface - mean(surface)).^2));
end


j=1:100000;
% creating log plot of roughness vs. time steps
loglog(j,vals(1,:));
hold on
% plotting linear fit to calculate slope
p = polyfit(log(j),log(vals(1,:)),1);
y1 = polyval(p,log(j));
plot(j,exp(y1));


title('Surface Roughness - Random Deposition 1+1D'); 
xlabel('Time Steps'); 
ylabel('Roughness'); 
legend('Measured Roughness','Polyfit','Location','SouthEast')
hold off

