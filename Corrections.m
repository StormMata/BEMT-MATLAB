function [CorrectionFactor] = Corrections(Blades,RotorRadius,Radius,InflowAngle,HubRadius)
%Returns the tip and hub correction factors
%   Detailed explanation goes here

TipFactor = (2 / pi) * acos(exp(-Blades / 2 * (RotorRadius - Radius) / (Radius * sin(InflowAngle))));

HubFactor = (2 / pi) * acos(exp(-Blades / 2 * (Radius - HubRadius)/(Radius * sin(InflowAngle))));

CorrectionFactor = TipFactor * HubFactor;

end