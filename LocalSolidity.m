function [LocalSolidity] = LocalSolidity(Blades,Chord,Radius)
%Returns the local solidity, sigma prime
%   Detailed explanation goes here

LocalSolidity = (Blades * Chord)/(2 * pi * Radius);         % [-]

end