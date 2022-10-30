function autoLoadSet(newX,newY,newWX,newWY)

newX = num2str(newX);
newY = num2str(newY);
newWX = num2str(newWX);
newWY = num2str(newWY);

handle1 = fopen('loadSet.m', 'r');
handle2 = fopen('NEWloadSet.m', 'w');

for i=1:16
    line = fgetl(handle1);
    
    if i==3 %there comes x
        newLine = eraseBetween(line, strfind(line,'=')+2,strfind(line,';')-1); %clean out the old value
        newLine = insertBefore(newLine,';',newX); %inject the new value
        fprintf(handle2,'%s\n', newLine);

    elseif i==4 %there comes x
        newLine = eraseBetween(line, strfind(line,'=')+2,strfind(line,';')-1); %clean out the old value
        newLine = insertBefore(newLine,';',newY); %inject the new value
        fprintf(handle2,'%s\n', newLine);
    
    elseif i==6 %there comes wx
        newLine = eraseBetween(line, strfind(line,'=')+2,strfind(line,';')-1); %clean out the old value
        newLine = insertBefore(newLine,';',newWX); %inject the new value
        fprintf(handle2,'%s\n', newLine);
    
    elseif i==7 %there comes wy
        newLine = eraseBetween(line, strfind(line,'=')+2,strfind(line,';')-1); %clean out the old value
        newLine = insertBefore(newLine,';',newWY); %inject the new value
        fprintf(handle2,'%s\n', newLine);
        
    else
        newLine = line;
        fprintf(handle2,'%s\n', newLine);
    end
    
end


fclose(handle1);
fclose(handle2);
delete('loadSet.m')
movefile NEWloadSet.m loadSet.m

end