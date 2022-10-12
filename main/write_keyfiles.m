function [] = write_keyfiles(FOLDER, nnode, nelm, coord, conn, face, crystals, secid)
    
    xg = coord(:,1);
    yg = coord(:,2);
    zg = coord(:,3);

    % write out nodal file nodes.k
    fileID = fopen(fullfile(FOLDER,'nodes.k'),'w');
    fprintf(fileID,'%s\n','*NODE');
    fprintf(fileID,'%1s%7s%16s%16s%16s\n','$','NID','X','Y','Z');
    for i = 1:nnode
        fprintf(fileID,'%8i',i);
        fprintf(fileID,'%16.8f%16.8f%16.8f\n',[xg(i) yg(i) zg(i)]);
    end
    
    % write out element file elements.k
    fileID = fopen(fullfile(FOLDER,'elements.k'),'w');
    fprintf(fileID,'%s\n','*ELEMENT_SOLID');
    fprintf(fileID,'%1s%7s%8s%8s%8s%8s%8s%8s%8s%8s%8s\n','$','EID','PID','N1','N2','N3','N4','N5','N6','N7','N8');
    for i = 1:nelm
        fprintf(fileID,'%8i%8i',i,crystals(i,4));
        fprintf(fileID,'%8i%8i%8i%8i%8i%8i%8i%8i\n',conn(i,:));
    end
    
    % write out database file database.k
    fileID = fopen(fullfile(FOLDER,'database.k'),'w');
    fprintf(fileID,'%s\n','*DATABASE_HISTORY_SOLID');
    for j = 1:nelm
        fprintf(fileID,'%10i',j);
        if rem(j,8) == 0
            fprintf(fileID,'\n');
        end
    end
    
    % write out node list file faces.k
    fileID = fopen(fullfile(FOLDER,'faces.k'),'w');
    for i = 1:size(face,2)
        fprintf(fileID,'%s\n','*SET_NODE_LIST');
        fprintf(fileID,'%10i\n',i);
        for j = 1:nnz(face(:,i))
            fprintf(fileID,'%10i',face(j,i));
            if rem(j,8) == 0
                fprintf(fileID,'\n');
            end
        end
        fprintf(fileID,'\n');
    end
    
    % write out part file
    uniq = unique(crystals, 'rows');
    fileID = fopen(fullfile(FOLDER,'parts.k'),'w');
    fprintf(fileID,'%s\n','$      PID     SECID       MID');
    fprintf(fileID,'%s\n','$         ');
    for ig = 1:size(uniq,1)
        grain = uniq(ig,4);
        fprintf(fileID,'%s\n','*PART');
        fprintf(fileID,'%s\n',strcat('GRAIN NO-',num2str(grain)));
        fprintf(fileID,'%10i',grain);
        fprintf(fileID,'%10i',secid);
        fprintf(fileID,'%10i\n',grain);
    end    
end