function [] = PrintProgress(node,i,index)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

if index == 1
    fprintf('Calculating Node = %2.0f.   ',node)
elseif index == 2
    fprintf('Converged in %2.0f iterations.\n\n',i)
end