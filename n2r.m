function [ko,kv,a,b,Lo1,Lo2,Lv1,Lv2] = n2r(bestofBestPar,m,statDel,b)

alpha = bestofBestPar(1);
beta = bestofBestPar(2);
Loo = bestofBestPar(3);
Lvo = bestofBestPar(4);

kv = ((m*9.81)/statDel)/2;
ko = (1/beta)*kv;

a = (1/alpha)*b;

Lo1 = Loo*a;
Lo2 = Lo1;

Lv1 = Lvo*b;
Lv2 = Lv1;

end

