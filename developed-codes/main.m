COM_CloseNXT all
close all
clear all

h = COM_OpenNXT('bluetooth.ini');
COM_SetDefaultNXT(h);

vtx = readvert('artur_third.fe'); %read and save the vertices informations in the vtx struct array 
traj = readtraj('trj9c.txt'); %read and save the order of the vertices that the robot will pass through 
vector = vectortraj(vtx,traj); %make an struct array with vectors that the robot will use to walk 

x = 40; %speed of rotation 
y = 40; %speed of going forward 

%OBS: BOTH SPEEDS MUST HAVE POSITIVE VALUES, EITHER THE PROGRAM WILL NOT
%WORK!

i=1;

%The next commands makes the robot do the first movement.
%The NXT is going to start with his ''noise'' pointing to 0 degrees, and if
%you ask it to rotate positive degrees, it'll rotate in the
%clockwise, and if you ask to rotate negative, it'll rotate
%counter-clockwise, that's why in the first and second have the minus
%signal in speed


currentenergy(i) = remainingenergy(NXT_GetBatteryLevel(h));
if vector(i).quadrant == 1
    RotateNXT(vector(i).angle,-x);
    WalkNXT(vector(i).module,y);
elseif vector(i).quadrant == 2
    RotateNXT((180-vector(i).angle),-x);
    WalkNXT(vector(i).module,y);
elseif vector(i).quadrant == 3 
    RotateNXT((180-vector(i).angle),x);
    WalkNXT(vector(i).module,y);
else %fourth quadrant 
    RotateNXT(vector(i).angle,x);
    WalkNXT(vector(i).module,y);
end

currentenergy(i+1) = remainingenergy(NXT_GetBatteryLevel(h));
energyused(i) = currentenergy(i+1)-currentenergy(i);

i=i+1;

while i<= length(vector)
    
    if (((vector(i-1).quadrant==1)&&(vector(i).quadrant==1))||((vector(i-1).quadrant==2)&&(vector(i).quadrant==2))||((vector(i-1).quadrant==3)&&(vector(i).quadrant==3))||((vector(i-1).quadrant==4)&&(vector(i).quadrant==4)))
        
        if (vector(i-1).angle > vector(i).angle)
            ang = (vector(i-1).angle - vector(i).angle);
            if (((vector(i-1).quadrant==2)&&(vector(i).quadrant==2))||((vector(i-1).quadrant==4)&&(vector(i).quadrant==4)))
                v = -x; %v is the rotation spd, and a negative valor does the robot rotate anticlockwise
                b = y; %b is the movement spd, and a negative valor does the robot move backward
            else
                v = x;
                b = y;
            end
        elseif (vector(i).angle > vector(i-1).angle)
            ang = (vector(i).angle - vector(i-1).angle);
            if (((vector(i-1).quadrant==2)&&(vector(i).quadrant==2))||((vector(i-1).quadrant==4)&&(vector(i).quadrant==4)))
                v = x;
                b = y;
            else
                v = -x;
                b = y;
            end
        else %vector(i-1).angle = vector(i).angle
            ang = 0;
            v = x;
            b = y;
        end
        
    elseif (((vector(i-1).quadrant==1)&&(vector(i).quadrant==2))||((vector(i-1).quadrant==2)&&(vector(i).quadrant==1))||((vector(i-1).quadrant==3)&&(vector(i).quadrant==4))||((vector(i-1).quadrant==4)&&(vector(i).quadrant==3)))
        
        ang = (180 - vector(i).angle - vector(i-1).angle);
        if (((vector(i-1).quadrant==2)&&(vector(i).quadrant==1))||((vector(i-1).quadrant==4)&&(vector(i).quadrant==3)))
            v = x;
            b = y;
        else
            v = -x;
            b = y;
        end
        
    elseif (((vector(i-1).quadrant==1)&&(vector(i).quadrant==3))||((vector(i-1).quadrant==2)&&(vector(i).quadrant==4))||((vector(i-1).quadrant==3)&&(vector(i).quadrant==1))||((vector(i-1).quadrant==4)&&(vector(i).quadrant==2)))
        ang = (180 + vector(i).angle - vector(i-1).angle);
        if (ang<180)
            if (((vector(i-1).quadrant==2)&&(vector(i).quadrant==4))||((vector(i-1).quadrant==4)&&(vector(i).quadrant==2)))
                v = x;
                b = y;
            else 
                v = -x;
                b = y;
            end
        elseif (ang>180)
            ang = 360-ang;
            if (((vector(i-1).quadrant==2)&&(vector(i).quadrant==4))||((vector(i-1).quadrant==4)&&(vector(i).quadrant==2)))
                v = -x;
                b = y;
            else
                v = x;
                b = y;
            end
        else % if ang = 180
            ang = 0;
            v = x;
            b = -y;
            vector(i).quadrant = vector(i-1).quadrant;
            vector(i).angle = vector(i-1).angle;
        end
        
    else % (((vector(i-1).quadrant==1)&&(vector(i).quadrant==4))||((vector(i-1).quadrant==4)&&(vector(i).quadrant==1))||((vector(i-1).quadrant==2)&&(vector(i).quadrant==3))||((vector(i-1).quadrant==3)&&(vector(i).quadrant==2)))
        ang = (vector(i-1).angle + vector(i).angle);
        if (((vector(i-1).quadrant==2)&&(vector(i).quadrant==3))||((vector(i-1).quadrant==4)&&(vector(i).quadrant==1))) 
            v = -x;
            b = y;
        else
            v = x;
            b = y;
        end
        
    end
    
    if (ang~=0)
    RotateNXT(ang,v);
    end
    WalkNXT(vector(i).module,b);
    i = i+1;
    currentenergy(i+1) = remainingenergy(NXT_GetBatteryLevel(h));
    energyused(i) = currentenergy(i)-currentenergy(i+1);
    
end




