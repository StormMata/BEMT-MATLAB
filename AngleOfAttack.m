function [AttackAngle] = AngleOfAttack(TwistAngle,InitialPitchAngle,InflowAngle)
%Returns the angle of attack, alpha
%   Detailed explanation goes here

LocalPitchAngle = TwistAngle + InitialPitchAngle;                           % Section pitch angle   [rad]

AttackAngle = InflowAngle - LocalPitchAngle;                                % Angle of attack       [deg]

end