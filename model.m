function xdot = model(t,x)

[m,ko,kv,co,cv,a,b,Lo1,Lo2,Lv1,Lv2,Xb,wxb,Yb,wyb] = loadModelPar();

wxb = wxb*2;
wyb = wyb*2;

xb = Xb*sin(wxb*t);
yb = Yb*sin(wyb*t);

xbd = wxb*Xb*cos(wxb*t);
ybd = wyb*Yb*cos(wyb*t);

X = (x(1)-xb);
Xd = (x(2)-xbd);
Y = (x(3)-yb);
Yd = (x(4)-ybd);

ro1 = sqrt((X+a)^2+Y^2);
ro2 = sqrt((X-a)^2+Y^2);
rv1 = sqrt((Y+b)^2+X^2);
rv2 = sqrt((Y-b)^2+X^2);

xOblq = 2*X-Lo1*((X+a)/ro1)-Lo2*((X-a)/ro2);
xVert = 2*X-Lv1*(X/rv1)-Lv2*(X/rv2);
fs_x = ko*xOblq + kv*xVert;

yOblq = 2*Y-Lo1*(Y/ro1)-Lo2*(Y/ro2);
yVert = 2*Y-Lv1*((Y+b)/rv1)-Lv2*((Y-b)/rv2);
fs_y = ko*yOblq + kv*yVert;

fd_x = co*(Xd*(X+a)^2+Yd*Y*(X+a))/(ro1^2) + cv*(Xd*X^2+Yd*X*(Y+b))/(rv1^2);
fd_y = co*(Xd*Y*(X+a)+Yd*Y^2)/(ro1^2) + cv*(Xd*X*(Y+b)+Yd*(Y+b)^2)/(rv1^2);

fx = fs_x + fd_x;
fy = fs_y + fd_y;

EoMx = -fx/m;
EoMy = -fy/m;

xdot(1) = x(2);
xdot(2) = EoMx;
xdot(3) = x(4);
xdot(4) = EoMy;

xdot=xdot';
end