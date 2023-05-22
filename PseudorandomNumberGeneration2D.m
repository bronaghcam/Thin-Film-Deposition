% Pseudoandom Number Generator - 2D plot
% 28th Jan. 2023
%Parameters for good generator
M=10^6;
a=2175;
c=143;
ri=3553; % initial value

% parameters for bad generator
% M=256;
% ri=10;
% a=57;
% c=1;

vals= []; % used to store ri and ri1 values

for j=1:M
ri1=mod((a*ri)+c,M);        
vals(1, length(vals)+1) =ri;  % first row stores ri values
vals(2, length(vals)) =ri1; % second row stores ri1 values
ri=ri1;  		    % updating value for ri
end

plot (vals(1, :),vals(2, :),'g*');
title ('Random Number Generation');
xlabel('ri');
ylabel('ri+1');
