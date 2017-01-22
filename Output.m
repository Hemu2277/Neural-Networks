function Output(predicted,date1)
% This function constructs the output from the given data

% Coded by Hemanth Manjunatha on Mar 30, 2016

fid = fopen('predictions.csv','w+');
fprintf(fid,'%s,%s\n','Date','Value');
formatOut = 'mm/dd/yyyy HH:MM:SS';

for i=1:length(predicted)
    
    fprintf(fid,'%s,',datestr(date1(i+50),formatOut));
    
    fprintf(fid,'%f\n',predicted(i));
    
end


end

