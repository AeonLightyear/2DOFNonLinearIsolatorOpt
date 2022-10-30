function Output = stifEq(a,beta,Loo,Lv,x,y)

ro1 = (sqrt(((x+1)^2)+((a*y)^2)))^3;
ro2 = (sqrt(((x-1)^2)+((a*y)^2)))^3;
rv1 = (sqrt(((x/a)^2)+((y+1)^2)))^3;
rv2 = (sqrt(((x/a)^2)+((y-1)^2)))^3;

p11 = (Loo*(y*a)^2)/ro1;
p12 = (Loo*(y*a)^2)/ro2;
p21 = (Lv*(y+1)^2)/rv1;
p22 = (Lv*(y-1)^2)/rv2;

b11 = (Loo*(x+1)^2)/ro1;
b12 = (Loo*(x-1)^2)/ro2;
b21 = (Lv*(x/a)^2)/rv1;
b22 = (Lv*(x/a)^2)/rv2;

K_x = (2-p11-p12)+(beta)*(2-p21-p22);
K_y = (1/beta)*(2-b11-b12)+(2-b21-b22);

Output = [K_x K_y];