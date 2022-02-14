function [LiftCoefficient,DragCoefficient] = CoefficientLookup(AttackAngle,NodeGeometryIndex)
%Returns the lift and drag coefficients for the angle of attack
%   Detailed explanation goes here

if NodeGeometryIndex == 1
    LookupTable=table2array(readtable('Cylinder1.xlsx'));
elseif NodeGeometryIndex == 2
    LookupTable=table2array(readtable('Cylinder2.xlsx'));
elseif NodeGeometryIndex == 3
    LookupTable=table2array(readtable('DU40.xlsx'));
elseif NodeGeometryIndex == 4
    LookupTable=table2array(readtable('DU35.xlsx'));
elseif NodeGeometryIndex == 5
    LookupTable=table2array(readtable('DU30.xlsx'));
elseif NodeGeometryIndex == 6
    LookupTable=table2array(readtable('DU25.xlsx'));
elseif NodeGeometryIndex == 7
    LookupTable=table2array(readtable('DU21.xlsx'));
elseif NodeGeometryIndex == 8
    LookupTable=table2array(readtable('NACA64.xlsx'));
end

AttackAngle = AttackAngle * 180 / pi;

[difference,index] = min(abs(LookupTable(:,1)-AttackAngle));                % Index of closest angle of attack

LiftCoefficient = LookupTable(index,2);                                     % Coefficient of lift       [-]
DragCoefficient = LookupTable(index,3);                                     % Coefficient of drag       [-]

end