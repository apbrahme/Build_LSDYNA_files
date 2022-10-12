function ranked = sort_crystals(FOLDER, crystals)
    list = sortrows(unique(crystals,'rows'), 4);
    unique_list = [list(:,1:3), histc(crystals(:,4), list(:,4))];
    ranked = sortrows(unique_list, 4, 'descend');
    
%     fileID = fopen(fullfile(FOLDER,'_crystals.k'),'w');
%     fprintf(fileID,'%10d\n',min(150, length(ranked)));
%     for ii = 1:min(350, length(ranked))
%         fprintf(fileID,'%10.6f%10.6f%10.6f%10d',ranked(ii,:));
%         if mod(ii,2) == 0
%             fprintf(fileID,'\n');
%         end
%     end
%     fclose(fileID);
end