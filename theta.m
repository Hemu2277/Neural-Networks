function [ t ] = theta( x, y)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
 
 
 [~,n] = size(y);
 
 %x = [ones(length(x),1),x];% adding bias term
 
 [~,b] = size(x);
 
 t = 6*rand(5*b+5*6+6*n,1)-3;
 
end

