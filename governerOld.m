% User defined parameters


% ---------------------------------------------
lbX = 0;
ubX = 0.5;
divX = 10;

lbY = 0;
ubY = 0.5;
divY = 10;

totalItter = 3;

%exAmpR: Excitation amplitude ratio (horizontal is some fraction of vertical: X/Y, or tan(offset_angle))
exAmpR = tan(pi/9);
% ---------------------------------------------

%create discreate points in the optimization domain
X = linspace(lbX,ubX,divX);
Y = linspace(lbY,ubY,divY);
%cross couple each discrate x and y
allPoints = combvec(X,Y);

numPoints = length(allPoints);
%calculate number of times optimization will be running
numOfOpt = totalItter*numPoints;

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

[bestofBestPar, bestPoint, bestIter, crossPolen, crossMax] = bestofBest(numPoints,allPoints,normalF,normalPar,wX,wY);

load gong.mat;
sound(y);