function [ A ] = make_A( x, p )
%MAKE_A construct A matrix for polynomial regression

A = ones(length(x), p+1);
for i = 1:p
    A(:, i+1) = x.^i;
end