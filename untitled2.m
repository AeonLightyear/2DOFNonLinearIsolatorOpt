x = 0.2;
y = linspace(0,0.3,10);


for i=1:length(y)
    
    Output = stifEq(10,0.4198,1.33,0.8,x,y(i));
    fprintf('%s \n', Output)
    

end