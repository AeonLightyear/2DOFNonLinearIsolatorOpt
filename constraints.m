function [C Ceq] = constraints(Input)

a = Input(1);
beta = Input(2);
Loo = Input(3);
Lv = Input(4);


X = linspace(0, 0.3, 5);
Y = linspace(0, 0.3, 5);

points = combvec(X,Y);

for i=1:length(points)
    x = points(1,i);
    y = points(2,i);

    K = stifEq(a,beta,Loo,Lv,x,y);
    
    %Kx
    C(2*i-1) = K(1);
    %Ky
    C(2*i) = K(2);

end
C = - min(C); %c(x) is the array of nonlinear inequality constraints at x. ga attempts to satisfy c(x) <= 0
Ceq = [];
end 