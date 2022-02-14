function [Power,Torque,Thrust] = RotorPower(AirDensity,MeanWind,Omega,Output,M)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here

%dP = 4 * pi * R^3 * AirDensity * MeanWind * Omega^2 (1 - Output(i,2)) * Output(i,3)
%dP = Omega * 0.5 * AirDensity * Outout(i,14)^2 * Blades * Output(i,13) * R * Output(i,4)

%fun = @(R) 4 * pi .* R.^3 .* AirDensity * MeanWind * Omega^2 * (1 - Output(i,2)) * Output(i,3);

% X = linspace(Output(4,11),Output(end,11),14*25);
% 
% a = polyval(polyfit(Output(4:end,11),Output(4:end,2),6),X);
% ap= polyval(polyfit(Output(4:end,11),Output(4:end,3),6),X);
% 
% R = linspace(1.5,63,17*25);
% a = [zeros(1,3*25) a];
% ap = [zeros(1,3*25) ap];

dP = zeros(1,M);                                        % Preallocate vectors
dQ = dP;
dT = dQ;

for i = 1:M

    Rstart = Output(i,11) - 0.5 * Output(i,12);         % Radius of element leading edge
    Rstop  = Output(i,11) + 0.5 * Output(i,12);         % Radius of element trailing edge

    R      = Rstart:0.01:Rstop;                         % Width of each element

%     dT(i)  = trapz(R, 4 * pi .* R * AirDensity * MeanWind^2 * (1 - Output(i,2)) * Output(i,2));             % Thrust
% 
%     dQ(i)  = trapz(R, 4 * pi .* R.^3 * AirDensity * MeanWind * Omega * (1 - Output(i,2)) * Output(i,3));    % Torque
% 
     dP(i)  = trapz(R, 4 * pi .* R.^3 * AirDensity * MeanWind * Omega^2 * (1 - Output(i,2)) * Output(i,3));  % Power

    %dP(i)  = trapz(R, 3 * Omega .* R * 0.5 * AirDensity * Output(i,14)^2 * Output(i,13) * (Output(i,7) * sin(Output(i,5)) - Output(i,8) * cos(Output(i,5))));

end 

Power  = dP;
Torque = dQ;
Thrust = dT;