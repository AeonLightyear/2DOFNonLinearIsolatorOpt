function [normalF,normalPar] = optHandler(allPoints, numPoints, totalItter, numOfOpt, exAmpR)


%create normalized force and related parameter arrays
normalF = cell(numPoints,totalItter);
normalPar = cell(numPoints,totalItter);

%set weights with respect to amplitude ratio
wX = exAmpR;
wY = 1-exAmpR;

for i=1:numPoints
    
    point = allPoints(:,i);  
    autoLoadSet(point(1),point(2),wX,wY);

    j = 1;
    while j<totalItter+1
        
        Output = gaOptimizer()
        normalF{i,j} = Output{2};
        normalPar{i,j} = Output{1};
        
        fprintf("Current point:  ");
        fprintf("x = ");
        fprintf('%d',point(1));
        fprintf(", y = ");
        fprintf('%d\n',point(2));
        
        fprintf("Number of iterations for the current point: ");
        fprintf('%d\n',j);
        
        fprintf("Number of points done: ");
        fprintf('%d\n',i-1);
        
        done = ((i-1)*totalItter)+j;
        perDone = round((done/numOfOpt)*100);
        fprintf("Percent Complete(%%): ");
        fprintf('%d\n',perDone);
        
        j = j+1;
    end
    
end

