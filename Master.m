clearvars

close all 

% Load the training data set into workspace
load('Training data.mat')
load('date1.mat')

% Train the neural networks
t = theta(x_train,y_train);
opttheta = fmincg(@(theta)nnCost(x_train,y_train,theta),t);

% predict 
output =predict(X,opttheta);
predicted = output(51:end);

% write the data into .csv file 
Output(predicted,date1)


% plot the predicted values and original data
hFig = figure(1);
set(hFig, 'Position', [250 250 900 400])
plot(output);
hold on
plot(y_train)
legend('Predicted data','Original data')