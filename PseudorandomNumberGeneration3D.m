% Pseudorandom Number Generator - 3D
% Bronagh Campbell - Feb. 28th 2023

% good generator parameters
M=(2^31)-1;
ri=1234; % initial value
a=16807;
c=0;

% bad generator parameters
% M=256;
% ri=10;
% a=57;
% c=1;

vals=[];    %used to store values for ri and ri1

for j=1:3000
ri1=mod((a*ri)+c,M);

vals(1,length(vals)+1)=ri;  
vals(2,length(vals))=ri1; 

ri=ri1;

end

% numbers in range [0,1]
z =vals(1,:)/M;
z2=vals(2,:)/M;

% creating 3 arrays to plot 3D 
x=z(1,1:1000);
y=z(1,1001:2000);
z=z(1,2001:3000);
markerColors=hsv(length(x));    % used to plot in random colours
scatter3(x,y,z,18,markerColors,'filled');
title("Random Number Generator - 3D");

