function [ThrustCoefficient] = ThrustCoefficient(LocalSolidity,AxialInductionFactor,LiftCoefficient,InflowAngle,DragCoefficient)
%Returns the thrust coefficient
%   Detailed explanation goes here

ThrustCoefficient = LocalSolidity * (1 - AxialInductionFactor)^2 * (LiftCoefficient * cos(InflowAngle) + DragCoefficient * sin(InflowAngle))/sin(InflowAngle)^2;

end