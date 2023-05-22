% Correlated Ballistic Deposition 1+1 D
% Bronagh Campbell - 25th Mar. 2023

% create initial surface
surface = zeros(1, 700);
 
% particles to be deposited
no_particles = 100000;

 x1=1;   % initial value for previous particle
 y=0;    % used to count number of particles that stick
for t = 1:no_particles
   % generating a random integer 1-500
    x = round(rand*699)+1;
   
    % Calculating probability that particle will stick
    % defining parameters
    c=400;
    d=abs(x1-x);
    n=-2;
    P = c*(d^n);
   
    if P>0.5    % if probability is greater than 0.5
       
        % incrementing surface height
        if x==1
        surface(x)=max(surface(x)+1,surface(x+1));
        elseif x==700
        surface(x)=max(surface(x-1),surface(x)+1);  
        else
        temp_max = max(surface(x-1),surface(x+1));
                   surface(x) = max(temp_max,surface(x)+1);
        end
        x1 = x;
        y=y+1;
        
    end


    hold on
    %plot(surface,'yo','MarkerSize',2,'MarkerFaceColor',[0.9290 0.6940 0.1250]);
    title('Correlated Ballistic Deposition 1+1D');
    xlabel('Length of Surface');
    ylabel('Height');
 
 
end
    hold off