function Output = loadSet()

x = 0;
y = 0;

wx = 0;
wy = 1;

lb = [0.1 0.001 0.8 0.8];
ub = [10 1000 1.33 1.33];

numOfVar = 4;


set = {x y wx wy lb ub numOfVar};
Output = set;
