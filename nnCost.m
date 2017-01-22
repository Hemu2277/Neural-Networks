function [J, Grad ] = nnCost( x,y,theta )
% Summary of this function goes here
% This is a costfunction with backward propagation
% The neural netwrok contains two hidden layers with 3
% neurons in each layer.
% Detailed explanation goes here

% Coded by Hemanth Manjunatha on Mar 28, 2016

% Initilaize the Variables
[a,b]=size(x);% a = Number of Training set, b = Number of features
  
J = 0;% Initial value of the cost function.
  
[m,n] = size(y); % m = Number of Training sets, same as 'a',n = output feature

% Rolling of theta vector into three matrices

% Each matrix corresponds to each weight between layers
theta2 = reshape(theta(1:5*b),5,b); % first layer weights

theta3 = reshape(theta(5*b+1:5*b+30),5,6); % second layer weights

theta4 = reshape(theta(5*b+31:end),n,6); % third layer weights

% Initilize the Gradient matrices

Grad2 = zeros(size(theta2));

Grad3 = zeros(size(theta3));

Grad4 = zeros(size(theta4));

% Forward propagation and Back Propagation
for i = 1:a
    %forward propagation
    act1 = x(i,:)'; % activation for Input layer
    
    z2  = theta2*act1;
    z2  = [1;z2]; % add the bias term
    act2 = sigmoid(z2); % activation for first hidden layer
    
    z3   = theta3*act2;
    z3   = [1;z3];% add the bias term
    act3 = sigmoid(z3); % activation for second hidden layer
    
    z4   = theta4*act3;
    act4 = z4; % Out hypothesis
   
    % Backward propagation
    delta4 = (act4 - y(i,:)');
    
    delta3 = theta4'*delta4.*Difsigmoid(z3);
    
    delta2 = theta3'*delta3(2:end).*Difsigmoid(z2);
    
    % To calculate Gradient
    Grad2 = Grad2 + delta2(2:end)*act1';
    
    Grad3 = Grad3 + delta3(2:end)*act2';
    
    Grad4 = Grad4 + delta4*act3';
    
    % To calculate cost function
     J = J+ 0.5*(sum((y(i,:)'-(act4)).^2));
end
%% Cost function and Gradient
J = J/m;

Grad = [Grad2(:);Grad3(:);Grad4(:)]/m;

end

