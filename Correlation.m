% This script gives the correlation coefficient bewteen two vectors 
R = zeros(9,2);
for i=2:10
    d = evalin('base',sprintf('S%d',i));
    S = evalin('base','s');
    L = corrcoef(S,d(1:50));
    subplot(3,3,i-1)
    scatter(d(1:50),S)
    ylabel('S1')
    xlabel(sprintf('S%d',i))
    R(i,:) = [L(1,2),L(2,1)];
end
    
    

