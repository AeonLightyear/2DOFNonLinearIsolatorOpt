function spitOut = gaOptimizer()
%LOAD PROBLEM PARAMETERS
set = loadSet(); %load weight and coordinate pairs
lb = set{5};
ub = set{6};
nvars = set{7};
%Linear Constraints
A = [];
b = [];
Aeq = [];
beq = [];

%SET GA OPTIONS
%Population Settings:
PopSize = 200;
InitialPopRange = [lb;ub]; %same as upper%lower bounds
CreationFun = 'gacreationuniform'; %or 'gacreationuniform' 'gacreationlinearfeasible'
%Tolarence and Stopping Criteria:
ConstraintTol = 1e-1;
FunTol = 1e-4;
MaxGen = 100;
%Fitness Evaluation:
FitnessScaling = 'fitscalingrank';
SelectionFun = 'selectionroulette';
EliteCnt = PopSize*0.1;
%Crossover Children:
CrossoverFun = 'crossoverscattered';
CrossoverFrac = 0.7;
%Mutation Children:
MutationFun = 'mutationadaptfeasible';
MigrationDirection = 'both';
MigrationFraction = 0.2;
MigrationInterval = 20;
%Display Options
PlotFun = {@gaplotbestindiv,@gaplotdistance,@gaplotrange,@gaplotmaxconstr};
Display = 'iter';

%Load Selected Options:
options = optimoptions('ga', ...
    'PopulationSize', PopSize, ...
    'InitialPopulationRange', InitialPopRange, ...
    'CreationFcn', CreationFun, ...
    'ConstraintTolerance', ConstraintTol, ...
    'FunctionTolerance', FunTol, ...
    'MaxGenerations', MaxGen, ...
    'FitnessScalingFcn', FitnessScaling, ...
    'SelectionFcn', SelectionFun, ...
    'EliteCount', EliteCnt, ...
    'CrossoverFcn', CrossoverFun, ...
    'CrossoverFraction', CrossoverFrac, ...
    'MutationFcn', MutationFun, ...
    'MigrationDirection', MigrationDirection, ...
    'MigrationFraction', MigrationFraction, ...
    'MigrationInterval', MigrationInterval, ...
    'PlotFcn', PlotFun, ...
    'Display', Display, ...
    'UseParallel', true);

%Solve
[optParameters,fval,exitflag,output,population,scores] = ga(@objective_func,nvars,A,b,Aeq,beq,lb,ub,@constraints,options);
spitOut = cell(1,6);
spitOut{1} = optParameters;
spitOut{2} = fval;
spitOut{3} = exitflag;
spitOut{4} = output;
spitOut{5} = population;
spitOut{6} = scores;
end