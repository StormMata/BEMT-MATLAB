function [AxialInductionFactor,AngularInductionFactor] = InitialInductionFactors(Omega,Radius,MeanWind,Blades,Chord,TwistAngle,InitialPitchAngle)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

TipSpeedRatio           = (Omega * Radius)/(MeanWind);                                  % [-]
LocalSolidity           = (Blades * Chord)/(2 * pi * Radius);                           % [-]
PitchAngle              = (TwistAngle + InitialPitchAngle);                             % [rad]

AxialInductionFactor    = (1/4)*(2 + pi * TipSpeedRatio * LocalSolidity - ...           % [-]
                sqrt(4 - 4 * pi * TipSpeedRatio * LocalSolidity + pi * ...
                TipSpeedRatio^2 * LocalSolidity * (8 * PitchAngle + pi * ...
                LocalSolidity)));

AngularInductionFactor  = 0;                                                            % [-]

end