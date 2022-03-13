%Caroline Deluce (101041614)
% MCPA
% Tutorial Jan 30th
%Matlab 2020b

clear all;
clc;
close all; 

numberOfElectrons = 1; 
dmax = 2e-7; %for initial position 
vmax = 1.27e5; %for thermal velocity
xmax = 200e-9; %x-bounds in nm
ymax = 100e-9; %y-bounds in nm 
A = xmax*ymax; %Area 
k = 1.281e-23; %boltzmann constant
q = 1.602176634e-19;

m = 0.26.*9.11e-31; %Mass  
ex = 0.1/200e-9;
fx = q*ex;
a = fx/m;
c = 1e11; %concentration
d = c*m; %density
disp(d);





Xpos = rand(numberOfElectrons,1)*0;
Ypos = rand(numberOfElectrons,1)*0;

Xvel = randn(numberOfElectrons,1).*0;
Yvel = randn(numberOfElectrons,1).*0;

  



colour = rand(numberOfElectrons, 1); %defining colour

timeStep = 1e-15; 


count = 1;

for time=1:1000
    


P = 0.05;


%Velocity

Xvel = Xvel + a*timeStep; %adding in acceleration
Yvel = Yvel + a*timeStep; %adding in acceleration

ranNew = rand(numberOfElectrons,1); %start of scattering
rx = ranNew < P; 

Xvel(rx) =  0; %new scattering velocities
Yvel(rx) = 0;



%for x value reflect
ixl = Xpos < 0;
Xvel(ixl) = (-1).*Xvel(ixl);
ixb = Xpos > xmax;
Xvel(ixb) = (-1).*Xvel(ixb);

%for y value reflect
iyl = Ypos < 0;
Yvel(iyl) = (-1).*Yvel(iyl);
iyb = Ypos > ymax;
Yvel(iyb) = (-1).*Yvel(iyb);


%calculating the position    
Xpos = Xpos + Xvel*(timeStep); 
Ypos = Ypos + Yvel*(timeStep);

Tvel = Yvel.^2+Xvel.^2;
    

%Plotting the scatter plot
scatter(Xpos, Ypos, 1, colour); 
hold on;
axis([0 xmax 0 ymax]);
xlabel('Semiconductor side length in meters');
ylabel('Semiconductor side length in meters');
title('Electron Modeling in a Semiconductor');
pause(0.001);
disp(Tvel);


end
