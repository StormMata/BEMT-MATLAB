function [NodeGeometryIndex,LocalRadius,ElementWidth,LocalTwistAngle,LocalChord] = LoadGeometry(NodeGeometryCorrespondence)
%Loads the blade geometry file
%   Detailed explanation goes here

DataTable         = readtable(NodeGeometryCorrespondence);

NodeGeometryIndex = table2array(DataTable(:,2));                               % Airfoil-Node Correspondence
LocalRadius       = table2array(DataTable(:,3));                               % Node radius           [m]
ElementWidth      = table2array(DataTable(:,4));                               % Width of each node    [m]
LocalTwistAngle   = table2array(DataTable(:,5));                               % Local twist angle     [deg]
LocalTwistAngle   = LocalTwistAngle * (pi / 180);                              % Local twist angle     [rad]
LocalChord        = table2array(DataTable(:,6));                               % Local chord length    [m]

end