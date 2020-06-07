function vtx = readvert(filename)
%   This function reads and saves all the values of the vertices file into a
% vector of structures. 
%   The input has to be a char and include also the file extension
%   For example: vtx = readvert('artur_third.fe')
warning('off','all')
arq=filename;
fid=fopen(arq,'rt');
lis=textread(arq,'%s');
fclose(fid);
delete arq;
i=1;
k=5;
while ~strcmp(lis(k),'edges')
 vtx(i).id = str2double(lis(k));
 vtx(i).y  = str2double(lis(k+2));
 vtx(i).z  = str2double(lis(k+3));
 
 if strcmp(lis(k+4),'original') 
     k=k+6;
 else
     k=k+4;
 end
 i=i+1; 
end
delete lis;
end

