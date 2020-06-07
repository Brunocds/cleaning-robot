function vector = vectortraj(vtx,traj)
%Once you have done the vertices and the trajectory vectors, you can call this
%function to make the struct array of the vectors that the robot will use to walk.
% Example:  vtx = readvert('artur_third.fe');
%           traj = readtraj('trj9c.txt');
%           vector = vectortraj(vtx,traj); 
%Each vector has the coordinates y and z, the angle formed with the y axis
%and the module of the vector. 

i=1;

while i <= (length(traj)-1)
    
    vectorpartial(i).y = vtx(traj(i+1)).y - vtx(traj(i)).y;
    vectorpartial(i).z = vtx(traj(i+1)).z - vtx(traj(i)).z;
    if ((vectorpartial(i).y==0)&&(vectorpartial(i).z>0))
        vectorpartial(i).angle = 90;
        vectorpartial(i).quadrant = 1; %in this case, it could be the first or second quadrant, because the angle is 90 degrees in reference to the second of first quadrant would be equal, in view that the angle of the second and first quadrants is in referente to the y axis in the z positive part
    elseif ((vectorpartial(i).y==0)&&(vectorpartial(i).z<0))
        vectorpartial(i).angle = 90;
        vectorpartial(i).quadrant = 3; %equal to the case before, but it could be third or fourth quadrant
    elseif ((vectorpartial(i).z==0)&&(vectorpartial(i).y>0))
        vectorpartial(i).angle = 0;
        vectorpartial(i).quadrant = 1; %it could be first or fourth quadrant
    elseif ((vectorpartial(i).z==0)&&(vectorpartial(i).y<0))
        vectorpartial(i).angle = 0;
        vectorpartial(i).quadrant = 3; %it could be second or third quadrant
    elseif ((vectorpartial(i).y>0)&&(vectorpartial(i).z<0))||((vectorpartial(i).y<0)&&(vectorpartial(i).z>0)) %atan makes negative angles, so to let everything positive I separated this case 
        vectorpartial(i).angle = int64(-1*(atan(vectorpartial(i).z/vectorpartial(i).y)*(180/pi)));
    else
        vectorpartial(i).angle = int64(atan(vectorpartial(i).z/vectorpartial(i).y)*(180/pi));
    end
    vectorpartial(i).module = 2.5*sqrt(((vectorpartial(i).z)^2)+((vectorpartial(i).y)^2)); %the integer multiplying has the fuction of making the trajectory more visible
    
    if ((vectorpartial(i).y>0)&&(vectorpartial(i).z>0))
        vectorpartial(i).quadrant = 1;
    elseif ((vectorpartial(i).y<0)&&(vectorpartial(i).z>0))
        vectorpartial(i).quadrant = 2;
    elseif ((vectorpartial(i).y<0)&&(vectorpartial(i).z<0))
        vectorpartial(i).quadrant = 3;
    elseif ((vectorpartial(i).y>0)&&(vectorpartial(i).z<0))
        vectorpartial(i).quadrant = 4;
    end 
    i = i+1;
end 

% the next part has the function of making a sequence of repeated angles turn
% into only one angle with all modules added to it

i=1;
partialmodule = 0;
cont = 0;
inicial = 0;

while (i<=length(vectorpartial)-1) %here I make a counter that has the value of repeated angles, and I use it to establish the size of the new vector that will not have repeated angles
    if (vectorpartial(i).angle == vectorpartial(i+1).angle)
        cont = cont + 1;
    end
    i = i+1;
end

i=1;

for j = 1:(length(vectorpartial)-cont)
    if (i ~= length(vectorpartial))
        if ((vectorpartial(i).angle == vectorpartial(i+1).angle)&(vectorpartial(i).quadrant == vectorpartial(i+1).quadrant))
            inicial = i;
            while ((vectorpartial(i).angle == vectorpartial(i+1).angle)&(vectorpartial(i).quadrant == vectorpartial(i+1).quadrant))
                partialmodule = partialmodule + vectorpartial(i+1).module;
                if ((i+1) ~= length(vectorpartial))
                    i = i+1;
                else
                    break
                end
            end
            vector(j).y = vectorpartial(inicial).y;
            vector(j).z = vectorpartial(inicial).z;
            vector(j).angle = vectorpartial(inicial).angle;
            vector(j).module = vectorpartial(inicial).module + partialmodule;
            vector(j).quadrant = vectorpartial(inicial).quadrant;
            partialmodule = 0;
            i=i+1;
        else
            vector(j).y = vectorpartial(i).y;
            vector(j).z = vectorpartial(i).z;
            vector(j).angle = vectorpartial(i).angle;
            vector(j).module = vectorpartial(i).module;
            vector(j).quadrant = vectorpartial(i).quadrant;
            i = i+1;
        end
    else
        if ((vectorpartial(i).angle == vectorpartial(i-1).angle)&&(vectorpartial(i).quadrant == vectorpartial(i-1).quadrant))
            vector(j-1).module = vectorpartial(i-1).module + vectorpartial(i).module;
        else
            vector(j).y = vectorpartial(i).y;
            vector(j).z = vectorpartial(i).z;
            vector(j).angle = vectorpartial(i).angle;
            vector(j).module = vectorpartial(i).module;
            vector(j).quadrant = vectorpartial(i).quadrant;
        end
    end
end

delete i;

end 