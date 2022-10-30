function autoLoadModelPar(m,ko,kv,co,cv,a,b,Lo1,Lo2,Lv1,Lv2,Xb,wxb,Yb,wyb)

m = num2str(m);
ko = num2str(ko);
kv = num2str(kv);
co = num2str(co);
cv = num2str(cv);
a = num2str(a);
b = num2str(b);
Lo1 = num2str(Lo1);
Lo2 = num2str(Lo2);
Lv1 = num2str(Lv1);
Lv2 = num2str(Lv2);
Xb = num2str(Xb);
wxb = num2str(wxb);
Yb = num2str(Yb);
wyb = num2str(wyb);


handle1 = fopen('loadModelPar.m', 'r');
handle2 = fopen('loadModelPar2.m', 'w');

for i=1:17
    line = fgetl(handle1);

    if i == 2
        newLine = eraseBetween(line, strfind(line,'=')+2,strfind(line,';')-1); %clean out the old value
        newLine = insertBefore(newLine,';',m); %inject the new value
        fprintf(handle2,'%s\n', newLine);
    
    elseif i==3
        newLine = eraseBetween(line, strfind(line,'=')+2,strfind(line,';')-1); %clean out the old value
        newLine = insertBefore(newLine,';',ko); %inject the new value
        fprintf(handle2,'%s\n', newLine);

    elseif i==4
        newLine = eraseBetween(line, strfind(line,'=')+2,strfind(line,';')-1); %clean out the old value
        newLine = insertBefore(newLine,';',kv); %inject the new value
        fprintf(handle2,'%s\n', newLine);

    elseif i==5
        newLine = eraseBetween(line, strfind(line,'=')+2,strfind(line,';')-1); %clean out the old value
        newLine = insertBefore(newLine,';',co); %inject the new value
        fprintf(handle2,'%s\n', newLine);

    elseif i==6
        newLine = eraseBetween(line, strfind(line,'=')+2,strfind(line,';')-1); %clean out the old value
        newLine = insertBefore(newLine,';',cv); %inject the new value
        fprintf(handle2,'%s\n', newLine);

    elseif i==7
        newLine = eraseBetween(line, strfind(line,'=')+2,strfind(line,';')-1); %clean out the old value
        newLine = insertBefore(newLine,';',a); %inject the new value
        fprintf(handle2,'%s\n', newLine);

    elseif i==8
        newLine = eraseBetween(line, strfind(line,'=')+2,strfind(line,';')-1); %clean out the old value
        newLine = insertBefore(newLine,';',b); %inject the new value
        fprintf(handle2,'%s\n', newLine);

    elseif i==9
        newLine = eraseBetween(line, strfind(line,'=')+2,strfind(line,';')-1); %clean out the old value
        newLine = insertBefore(newLine,';',Lo1); %inject the new value
        fprintf(handle2,'%s\n', newLine);

    elseif i==10
        newLine = eraseBetween(line, strfind(line,'=')+2,strfind(line,';')-1); %clean out the old value
        newLine = insertBefore(newLine,';',Lo2); %inject the new value
        fprintf(handle2,'%s\n', newLine);

    elseif i==11
        newLine = eraseBetween(line, strfind(line,'=')+2,strfind(line,';')-1); %clean out the old value
        newLine = insertBefore(newLine,';',Lv1); %inject the new value
        fprintf(handle2,'%s\n', newLine);

    elseif i==12
        newLine = eraseBetween(line, strfind(line,'=')+2,strfind(line,';')-1); %clean out the old value
        newLine = insertBefore(newLine,';',Lv2); %inject the new value
        fprintf(handle2,'%s\n', newLine);

    elseif i==13
        newLine = eraseBetween(line, strfind(line,'=')+2,strfind(line,';')-1); %clean out the old value
        newLine = insertBefore(newLine,';',Xb); %inject the new value
        fprintf(handle2,'%s\n', newLine);

    elseif i==14
        newLine = eraseBetween(line, strfind(line,'=')+2,strfind(line,';')-1); %clean out the old value
        newLine = insertBefore(newLine,';',wxb); %inject the new value
        fprintf(handle2,'%s\n', newLine);

    elseif i==15
        newLine = eraseBetween(line, strfind(line,'=')+2,strfind(line,';')-1); %clean out the old value
        newLine = insertBefore(newLine,';',Yb); %inject the new value
        fprintf(handle2,'%s\n', newLine);
    
    elseif i==16
        newLine = eraseBetween(line, strfind(line,'=')+2,strfind(line,';')-1); %clean out the old value
        newLine = insertBefore(newLine,';',wyb); %inject the new value
        fprintf(handle2,'%s\n', newLine);

    else
        newLine = line;
        fprintf(handle2,'%s\n', newLine);
    end

end

fclose(handle1);
fclose(handle2);

delete('loadModelPar.m')
movefile loadModelPar2.m loadModelPar.m

end