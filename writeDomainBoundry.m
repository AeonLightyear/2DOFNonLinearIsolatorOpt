function writeDomainBoundry(ubX, ubY)

newX = num2str(ubX);
newY = num2str(ubY);

handle1 = fopen('readDomainBoundry.m', 'r');
handle2 = fopen('NEWreadDomainBoundry.m', 'w');

for i=1:6
    line = fgetl(handle1);
    
    if i==3 %there comes x
        newLine = eraseBetween(line, strfind(line,'=')+2,strfind(line,';')-1); %clean out the old value
        newLine = insertBefore(newLine,';',newX); %inject the new value
        fprintf(handle2,'%s\n', newLine);

    elseif i==4 %there comes y
        newLine = eraseBetween(line, strfind(line,'=')+2,strfind(line,';')-1); %clean out the old value
        newLine = insertBefore(newLine,';',newY); %inject the new value
        fprintf(handle2,'%s\n', newLine);
        
    else
        newLine = line;
        fprintf(handle2,'%s\n', newLine);
    end
    
end


fclose(handle1);
fclose(handle2);
delete('readDomainBoundry.m')
movefile NEWreadDomainBoundry.m readDomainBoundry.m

end