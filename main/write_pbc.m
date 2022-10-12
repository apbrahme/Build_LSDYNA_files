function write_pbc(FOLDER, face)

    labels = {'x','y','z'};
    subfolder = fullfile(FOLDER,'bounds');    
    for i = 1:3
        for m = 1:3
            fileID = fopen(fullfile(subfolder,['pbc_',num2str(i),labels{m},'.k']),'w');
            fprintf(fileID,'%s\n','*CONSTRAINED_MULTIPLE_GLOBAL');
            fprintf(fileID,'%10i\n',6+3*(i-1)+m);

            for j = 1:nnz(face(:,i))
                fprintf(fileID,'%10i\n',2);
                fprintf(fileID,'%10i%10i%10.1f\n',face(j,i),m,1.0);
                fprintf(fileID,'%10i%10i%10.1f\n',face(j,3+i),m,-1.0);
            end
        end
    end
    
end



% % % % %     % Constrained nodal set for each face
% % % % %     subfolder = fullfile(FOLDER,'bounds');
% % % % %     make_dir(subfolder);
% % % % %     for i = 1:size(face,2)
% % % % %         fileID = fopen(fullfile(subfolder,['csf_',num2str(i),'.k']),'w');
% % % % %         fprintf(fileID,'%s\n','*CONSTRAINED_MULTIPLE_GLOBAL');
% % % % %         fprintf(fileID,'%10i\n',i);
% % % % % 
% % % % %         if i == 1 || i == 4
% % % % %             plane = 1; % X
% % % % %         elseif i == 2 || i == 5
% % % % %             plane = 2; % Y
% % % % %         elseif i == 3 || i == 6
% % % % %             plane = 3; % Z
% % % % %         end
% % % % % 
% % % % %         for j = 2:nnz(face(:,i))
% % % % %             fprintf(fileID,'%10i\n',2);
% % % % %             fprintf(fileID,'%10i%10i%10.1f\n',face(1,i),plane,1.0);
% % % % %             fprintf(fileID,'%10i%10i%10.1f\n',face(j,i),plane,-1.0);
% % % % %         end         
% % % % %     end