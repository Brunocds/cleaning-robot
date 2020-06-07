function traj = readtraj(filename)
%   This function reads and saves all the values of the trajectory file into a
% vector.
%   The input has to be a char and include also the file extension (which usually is
%   .txt)
%   For example: traj = readtraj('trj9c.txt')
warning('off','all')
arq=filename;
fid=fopen(arq,'rt');
lis=textread(arq,'%s');
fclose(fid);delete arq;
i=1;
while ~strcmp(lis(i),'\')
    traj(i) = str2double(lis(i));
    i=i+1;
end
delete lis;
end