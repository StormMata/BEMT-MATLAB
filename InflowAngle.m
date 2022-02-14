function [phi,Vrel] = InflowAngle(WindSpeed,AxialInductionFactor,Omega,Radius,AngularInductionFactor)
%Returns the inflow angle, phi
%   Takes the inflow wind speed, a, a', tip speed ration, and local radius
%   to determine the inflow angle, phi

N = WindSpeed * (1 - AxialInductionFactor);
D = Omega * Radius * (1 + AngularInductionFactor);

phi     = atan2(N,D);                       % Inflow angle          [rad]

Vrel = WindSpeed * (1 - AngularInductionFactor)/sin(phi);

end