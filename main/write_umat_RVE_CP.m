function [] = write_umat_RVE_CP(FOLDER, crystals)

    % write out material file material.k
    fileID = fopen(fullfile(FOLDER,'matcp.k'),'w');
    fprintf(fileID,'%s\n','$      MID        RO        MT       LMC       NHV    IORTHO     IBULK        IG');
    fprintf(fileID,'%s\n','$    IVECT     IFAIL    ITHERM    IHYPER      IEOS      LMCA');
    fprintf(fileID,'%s\n','$  - - CM(*) - - ');
    fprintf(fileID,'%s\n','$       G0        K0    IDEBUG      IGRN    IHMODL    THETA1       PHI    THETA2');
    fprintf(fileID,'%s\n','$      C11       C12       C44');
    fprintf(fileID,'%s\n','$     GDOT       XMX       QAB      TAU0        H1        H2        H3        H4');
    fprintf(fileID,'%s\n','$  - - - - - - - ');

    uniq = unique(crystals, 'rows');
    for ig = 1:size(uniq,1)
        grain = uniq(ig,:);
        fprintf(fileID,'%s\n','*MAT_USER_DEFINED_MATERIAL_MODELS');
        fprintf(fileID,'%10i',grain(4));
        fprintf(fileID,'%s\n','       &RO        47      &LMC      &NHV         0         2         1');    
        fprintf(fileID,'%s\n','         0         1         0         1');
        fprintf(fileID,'%s',  '       &G0       &K0         0');
        fprintf(fileID,'%10i',grain(4));
        fprintf(fileID,'%s','   &IHMODL');
        fprintf(fileID,'%10.6f%10.6f%10.6f\n',[grain(1), grain(2), grain(3)]);
        fprintf(fileID,'%s\n','      &C11      &C12      &C44                              ');    
        fprintf(fileID,'%s\n','     &GDOT      &XMX      &QAB     &TAU0       &H1       &H2       &H3       &H4');
    end
    
end