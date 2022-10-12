function [] = write_erosion(FOLDER, crystals, fsig)

    uniq = unique(crystals, 'rows');

    % write out material file material.k
    fileID = fopen(fullfile(FOLDER,'erosion.k'),'w');
    fprintf(fileID,'%s\n','*CONTROL_MAT');
    fprintf(fileID,'%s\n','$     MAEF');
    fprintf(fileID,'%s\n','         0');
    fprintf(fileID,'%s\n','$ - - - - - - - - ');
    fprintf(fileID,'%s\n','$      MID      EXCL    MXPRES     MNEPS    EFFEPS    VOLEPS    NUMFIP       NCS');
    fprintf(fileID,'%s\n','$   MNPRES     SIGP1     SIGVM     MXEPS     EPSSH     SIGTH   IMPULSE    FAILTM');
    
    for ig = 1:size(uniq,1)
        grain = uniq(ig,4);
        fprintf(fileID,'%s\n','*MAT_ADD_EROSION');
        fprintf(fileID,'%10i         0         0         0         0         0         1         1\n', grain);
        fprintf(fileID,'                              %10.6f                                        \n', fsig);
    end
    
end