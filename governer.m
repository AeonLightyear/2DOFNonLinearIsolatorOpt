
% take base excitation as input and calculate amplitude ratio

rBase = 0.025;
wBase = 62;
thetaM = 0/4; %angle of missalignment in radians

wxb = wBase;
wyb = wBase;

% take weight of the mass, statDel and b
m = 3;
statDel = 0.02;
b = 0.1;
co = 0;
cv = 0;


% initial variables for optimization and set optimization weights
% lower bound, upper bound, and number of divisions

lbX = 0;
ubX = 0.1;
divX = 6;

lbY = 0;
ubY = 0.1;
divY = 6;

totalItter = 3;

%exAmpR: Excitation amplitude ratio (horizontal is some fraction of vertical: X/Y)

Xb = rBase*sin(thetaM);
Yb = rBase*cos(thetaM);

exAmpR = tan(thetaM)/2;


% define new motion domain and repeat the process
optDomainTol = 0.001;
domainDelX = 10;
domainDelY = 10;
realDomX = 0.3;
realDomY = 0.3;



while abs(domainDelX) > optDomainTol || abs(domainDelY) > optDomainTol

    if realDomX > 0.5 || realDomY > 0.5
        fprintf("Normalized response is larger than 0.5. Consider increasing b!");
        domainDelX = 0;
        domainDelY = 0;

    else
    
    ubX = realDomX;
    ubY = realDomY;
    %writeDomainBoundry(realDomX, realDomY);
    
    % discretise the domain of motion
    [allPoints, numPoints, numOfOpt] = discretiseMotionDomain(lbX,ubX,divX,lbY,ubY,divY,totalItter);
    
    % run optimization
    [normalF,normalPar] = optHandler(allPoints, numPoints, totalItter, numOfOpt, exAmpR);
    
    % calculate best of the best
    [bestofBestPar, bestPoint, bestIter, crossPolen, crossMax] = bestofBest(numPoints,allPoints,normalF,normalPar,exAmpR);
    
    % convert normalized parameters to real values
    [ko,kv,a,b,Lo1,Lo2,Lv1,Lv2] = n2r(bestofBestPar,m,statDel,b);
    
    % run numeric solver
    x0 = [0 0];
    y0 = [0 0];
    t0 = 0;
    t1 = 20;
    [X, Y, t] = numSolver([m,ko,kv,co,cv,a,b,Lo1,Lo2,Lv1,Lv2,Xb,wxb,Yb,wyb], x0, y0, t0, t1);
    
    realDomX = max(abs(X))/a;
    realDomY = max(abs(Y))/b;
    
    domainDelX = realDomX - ubX;
    domainDelY = realDomY - ubY;

    end

    fprintf("realDomX: ");
    fprintf('%d',realDomX);
    fprintf("realDomY: ");
    fprintf('%d',realDomY);
    fprintf("bestofBestPar: ");
    fprintf('%d',bestofBestPar);
    fprintf("bestPoint: ");
    fprintf('%d',bestPoint);
    fprintf("domainDelX: ");
    fprintf('%d',domainDelX);
    fprintf("domainDelY: ");
    fprintf('%d',domainDelY);
    plot(t,X)
    plot(t,Y)
end

fprintf("Response domain and optimization domains have converged.");