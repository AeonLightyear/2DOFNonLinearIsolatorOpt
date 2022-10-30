function [allPoints, numPoints, numOfOpt] = discretiseMotionDomain(lbX,ubX,divX,lbY,ubY,divY,totalItter) 

%create discreate points in the optimization domain
X = linspace(lbX,ubX,divX);
Y = linspace(lbY,ubY,divY);
%cross couple each discrate x and y
allPoints = combvec(X,Y);

numPoints = length(allPoints);
%calculate number of times optimization will be running
numOfOpt = totalItter*numPoints;