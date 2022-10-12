function fig = plot_nodes(nelm, conn, coord)
    xx = coord(:,1)';
    yy = coord(:,2)';
    zz = coord(:,3)';
    
    fig = figure;
    hold on;
    for e = 1:nelm
        scatter = conn(e,:);
        xe = xx(scatter);
        ye = yy(scatter);
        ze = zz(scatter);

        plotTYPE = '-or';

        xyz = [[xe(1:4)'; xe(1)], [ye(1:4)'; ye(1)], [ze(1:4)'; ze(1)]];
        plot3(xyz(:,1),xyz(:,2),xyz(:,3),plotTYPE);
        xyz = [[xe(5:8)'; xe(5)], [ye(5:8)'; ye(5)], [ze(5:8)'; ze(5)]];
        plot3(xyz(:,1),xyz(:,2),xyz(:,3),plotTYPE);
        xyz = [[xe(3:4)'; xe(8); xe(7); xe(3)], [ye(3:4)'; ye(8); ye(7); ye(3)], [ze(3:4)'; ze(8); ze(7); ze(3)]];
        plot3(xyz(:,1),xyz(:,2),xyz(:,3),plotTYPE);
        xyz = [[xe(1:2)'; xe(6); xe(5); xe(1)], [ye(1:2)'; ye(6); ye(5); ye(1)], [ze(1:2)'; ze(6); ze(5); ze(1)]];
        plot3(xyz(:,1),xyz(:,2),xyz(:,3),plotTYPE);

        xlabel('X');
        ylabel('Y');
        zlabel('Z');
        
        view([-1.5,-1,0.5]);
    end
end