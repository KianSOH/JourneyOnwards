function [MAT] = LATTICE(N)
%https://projecteuler.net/problem=15 This is attempting to answer question
%15.
% Proposed solution is to 1. create vertices representation of the NXN
% GRID.
% By using the following equation, if NXN Grid is say 2X2, a Matrix of
% (N+1 X N+1) of Ones is used to represent the existence of the vertices.
% N must be a positive scalar integer.
% 2. Next algorithm is to find the possible paths to reach (N+1,N+1) vertices from (1,1) vertice. 
MAT = [];%preallocating temp Matrix for calculations.

if ~isscalar(N) || floor(N) ~= N || N < 0
    error('N input value must be a Positive Scalar Integer')
else
    MAT = ones(N+1,N+1);
end

