function [bestofBestPar, bestPoint, bestIter, crossPolen, crossMax] = bestofBest(numPoints,allPoints,normalF,normalPar,exAmpR)

wX = exAmpR;
wY = 1-exAmpR;

bestIter = cell(numPoints,2);

crossPolen = zeros(numPoints,numPoints);
crossMax = zeros(numPoints,1);

for i=1:numPoints
    
    [val, j] = min(cell2mat(normalF(1,:)));
    
    bestIter{i,1} = val;
    bestIter{i,2} = normalPar{i,j};
end

for i=1:numPoints
    
    a = bestIter{i,2}(1);
    beta = bestIter{i,2}(2);
    Loo = bestIter{i,2}(3);
    Lv = bestIter{i,2}(4);
    
    for j=1:numPoints

        x = allPoints(1,j);
        y = allPoints(2,j);
        
        K = stifEq(a,beta,Loo,Lv,x,y);
        K_x = K(1);
        K_y = K(2);
        crossPolen(i,j) = [wX wY]*[K_y K_x]';
        
    end

    crossMax(i) = max(crossPolen(i,:));

end

[~, l] = min(crossMax);

bestPoint = l;
bestofBestPar = bestIter{l,2};