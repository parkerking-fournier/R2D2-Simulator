% A function to find the best fit of a line
function b = bestfit(y)
    y = y';
    time = 1:length(y);
    time = time';
    line = fit( time, y, 'poly8', 'Normalize', 'on' );
    line = line(1:length(y));
    for i = 1:length(line)
        if y(i) == 0
           line(i) = 0;
        end  
    end
    b = line;
end