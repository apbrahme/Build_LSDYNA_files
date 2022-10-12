function crystals = read_crystals(filename)
    try
        lines = get_lines(filename);
        fid = fopen(filename, 'r');

        crystals = zeros(lines, 4);
        
        ix = 0;
        while 1
            read = fscanf(fid, '%f %f %f %f', [1, 4]);

            if isempty(read)
                break
            end
            ix = ix + 1;
            crystals(ix,:) = read;
        end
        fclose(fid);
        
    catch
        fprintf('Warning: error reading texture file\n')
        crystals = zeros(125000,3);
        crystals(:,4) = 1;
    end
end

function lines = get_lines(filename)
    fid = fopen(filename,'r');
    allText = textscan(fid,'%s','delimiter','\n');
    lines = length(allText{1});
    fclose(fid);
end