function [AxialInductionFactor,AngularInductionFactor] = InductionFactors(CorrectionFactor,ThrustCoefficient,InflowAngle,LocalSolidity,LiftCoefficient,DragCoefficient)
%Returns the axial and angular induction factors, a and a'
%   Detailed explanation goes here

if ThrustCoefficient > 0.96 %* CorrectionFactor

    AxialInductionFactor = (18 * CorrectionFactor - 20 - 3 * sqrt(ThrustCoefficient * (50 - 36 * CorrectionFactor) + 12 * CorrectionFactor * (3 * CorrectionFactor - 4)))/(36 * CorrectionFactor - 50);

    %AxialInductionFactor = (1/CorrectionFactor) * (0.143 + sqrt(0.0203 - 0.6427*(0.889 - ThrustCoefficient)));

    %fprintf('Glauert')

else

    AxialInductionFactor = 1/(1 + (4 * CorrectionFactor * sin(InflowAngle)^2)/(LocalSolidity *(LiftCoefficient * cos(InflowAngle) + DragCoefficient * sin(InflowAngle))));

    %fprintf('Standard BEM')

end

AngularInductionFactor = 1/((4 * CorrectionFactor * sin(InflowAngle) * cos(InflowAngle))/(LocalSolidity * (LiftCoefficient * sin(InflowAngle) - DragCoefficient * cos(InflowAngle))) - 1);

end