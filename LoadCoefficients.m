function [CoefficientTable] = LoadCoefficients(AlphaCoefficientCorrespondence)
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here

DataTable        = readtable(AlphaCoefficientCorrespondence);               % Lift and Drag tables
DataTable        = table2array(DataTable);                                  % Convert to matrix
DataTable(:,1)   = DataTable(:,1) * (pi / 180);

CoefficientTable = fillmissing(DataTable,'pchip');                          % Interpolate missing values

end