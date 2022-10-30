function Output = objective_func(Input)

a = Input(1);
beta = Input(2);
Loo = Input(3);
Lv = Input(4);

set = loadSet();
x = set{1};
y = set{2};
wx = set{3};
wy = set{4};

K = stifEq(a,beta,Loo,Lv,x,y);

K_x = K(1);
K_y = K(2);


%Output = [K_y K_x];
Output = [wy wx]*[K_y K_x]';