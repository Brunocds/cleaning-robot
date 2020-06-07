COM_CloseNXT all
close all
clear all

h = COM_OpenNXT('bluetooth.ini');
COM_SetDefaultNXT(h);

i=1;
j=1;

while i>0
    %if(mod(i,10)==0)
        batteryvoltage(i) = NXT_GetBatteryLevel(h);
        %j = j+1;
    %end
    RotateNXT(360,50)
    i = i+1
end