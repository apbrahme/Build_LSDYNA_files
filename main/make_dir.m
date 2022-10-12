function [] = makedir(foldername)
    if ( exist(sprintf('./%s',foldername),'dir') ~= 0)
        rmdir(sprintf('./%s',foldername),'s');
    end
    mkdir(foldername);
end