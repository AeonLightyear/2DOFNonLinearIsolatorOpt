function [X, Y, t] = numSolver(parameters, x0, y0, t0, t1)


m = parameters(1) ;
ko = parameters(2) ;
kv = parameters(3) ;
co = parameters(4) ;
cv = parameters(5) ;
a = parameters(6) ;
b = parameters(7) ;
Lo1 = parameters(8) ;
Lo2 = parameters(9) ;
Lv1 = parameters(10);
Lv2 = parameters(11);
Xb = parameters(12);
wxb = parameters(13);
Yb = parameters(14);
wyb = parameters(15);

%load parameters to the model
autoLoadModelPar(m,ko,kv,co,cv,a,b,Lo1,Lo2,Lv1,Lv2,Xb,wxb,Yb,wyb);

options = odeset('RelTol',1e-10, 'AbsTol', 1e-10);
%[t,x] = ode45(@model,[time_start time_end],[initial_displacement initial_velocity]);
 [t,x] = ode45(@model,[t0 t1],[x0 y0], options);

X=x(:,1);
Y=x(:,3);