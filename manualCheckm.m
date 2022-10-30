

[ko,kv,a,b,Lo1,Lo2,Lv1,Lv2] = n2r([0.6    0.3    1.3    1], m, statDel, b);
[X, Y, t] = numSolver([m,ko,kv,co,cv,a,b,Lo1,Lo2,Lv1,Lv2,Xb,wxb,Yb,wyb], x0, y0, t0, t1);
a1 = plot(X,Y);

hold on

manual = max(sqrt(X.^2 + Y.^2))

[ko,kv,a,b,Lo1,Lo2,Lv1,Lv2] = n2r(bestofBestPar,m,statDel,b);
[X, Y, t] = numSolver([m,ko,kv,co,cv,a,b,Lo1,Lo2,Lv1,Lv2,Xb,wxb,Yb,wyb], x0, y0, t0, t1);
a2 = plot(X,Y);

optimal = max(sqrt(X.^2 + Y.^2))