function [ predicted_y ] = predict(x,opttheta )
% Summary of this function goes here
% This code is used to predict new output from learnt Gradients

% Detailed explanation goes here

% Initialise the parameters
act4 = zeros(length(x),1);
[a,b]=size(x);


% Reshaping of parameters
theta2 = reshape(opttheta(1:5*b),5,b); % first layer weights

theta3 = reshape(opttheta(5*b+1:5*b+30),5,6); % second layer weights

theta4 = reshape(opttheta(5*b+31:end),1,6); % third layer weights

% Forward propagation
for i = 1:a
   act1 = x(i,:)'; % activation for Input layer
    
    z2  = theta2*act1;
    z2  = [1;z2];% adding the bias term
    act2 = sigmoid(z2); % activation for first hidden layer
    
    z3   = theta3*act2;
    z3   = [1;z3]; % adding the bias term
    act3 = sigmoid(z3); % activation for second hidden layer
    
    z4   = theta4*act3;
    act4(i,:) =z4; % Out hypothesis
end
    
predicted_y = act4;
end

