% Pseudorandom Number Generator -1D
% Bronagh Campbell - jan. 30th 2023

% good generator parameters
M=(2^31)-1;
ri=1234;    % initial value
a=16807;
c=0;

% bad generator parameters
% M=256;
% ri=10;
% a=57;
% c=1;
vals=[];    % used to store ri and ri1

for j=1:3000
ri1=mod((a*ri)+c,M);

vals(1,length(vals)+1)=ri;  
vals(2,length(vals))=ri1; 

ri=ri1;

end

% numbers in range [0,1]
z =vals(1,:)/M;
z2=vals(2,:)/M;

plot(i(1:1000),vals(1,1:1000)/M,'-*');
title('Random Number Generation -1D');
xlabel('Sequence Number');
ylabel('Random Number');
xlim([1 1000]);
ylim([0 1]);