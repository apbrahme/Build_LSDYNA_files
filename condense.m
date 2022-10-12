clear;

inputFile = 'fitted_cent.txt';

% Original RVE size
xnum = 100;
ynum = 100;
znum = 100;

% Reduce RVE side length by a factor of:
multiple = 2; 


% Open inputFile
fileID = fopen(inputFile,'r');
allText = textscan(fileID,'%s','delimiter','\n');
numberOfLines = length(allText{1});
fclose(fileID);
fileID = fopen(inputFile,'r');


% Scan input file
n = 0;
ebsd = zeros(numberOfLines,7);
while 1
    n = n + 1;
    read = fscanf(fileID, '%f %f %f %f %f %f %f', [1,7]);
    if length(read) == 0
        break
    end
    ebsd(n,:) = read;
end


% Sample RVE to desired size
G = zeros(numberOfLines,7);
n = 0; m = 0;
for k = 1:znum
    for i = 1:xnum
        for j = 1:ynum
            n = n + 1;
            if (rem(i,multiple) == 0) && (rem(j,multiple) == 0) && (rem(k,multiple) == 0)
                m = m + 1;
                G(m,:) = ebsd(n,:);
            end
        end
    end
end

% Print out new RVE file
fileEBSD = fopen(['EBSD_', num2str(m)],'w');
filePF   = fopen(['PF_', num2str(m)],'w');
for i = 1:m
    fprintf(fileEBSD,'%f  %f  %f  %f  %f  %f %f\n',G(i,1:7));
    fprintf(filePF  ,'%f  %f  %f  %f\n',G(i,4:7));
end

