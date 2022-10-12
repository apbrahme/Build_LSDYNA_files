function [nnode, nelm, coord, conn, face] = grid_box(ntx, nty, ntz, ax, ay, az)

    % Nodal XYZ coordinates
    node = 0;
    nnode = (ntz+1)*(nty+1)*(ntx+1);
    xg = zeros(1,nnode);
    yg = zeros(1,nnode);
    zg = zeros(1,nnode);
    for iz = 1:ntz+1
        for iy = 1:nty+1
            for ix = 1:ntx+1
                node = node + 1;
                xg(node) = ax*(ix-1)/ntx;
                yg(node) = ay*(iy-1)/nty;
                zg(node) = az*(iz-1)/ntz;
            end
        end
    end
    
%     nnode = node;
    coord = [xg' yg' zg'];

    % Element connectivity matrix
    elm = 0;
    nelm = ntx*nty*ntz;
    conn = zeros(nelm,8);
    for iz = 1:ntz
        for iy = 1:nty
            for ix = 1:ntx
                elm = elm + 1;
                conn(elm,1) = (iz-1)*(ntx+1)*(nty+1) + (iy-1)*(ntx+1) + ix;
                conn(elm,2) = conn(elm,1) + 1;
                conn(elm,4) = conn(elm,1) + (ntx+1);
                conn(elm,3) = conn(elm,4) + 1;
                conn(elm,5) = conn(elm,1) + (ntx+1)*(nty+1);
                conn(elm,6) = conn(elm,5) + 1;
                conn(elm,8) = conn(elm,5) + (ntx+1);
                conn(elm,7) = conn(elm,8) + 1;
            end
        end
    end
%     nelm = elm;

    % Node lists for each face
    n = 0;
    for iz = 1:ntz+1
        for iy = 1:nty+1
            n = n+1;
            face(n,1) = (iz-1)*(ntx+1)*(nty+1) + (iy-1)*(ntx+1) + 1;
            face(n,4) = face(n,1) + ntx;
        end
    end

    n = 0;
    for iz = 1:ntz+1
        for ix = 1:ntx+1
            n = n+1;
            face(n,2) = (iz-1)*(ntx+1)*(nty+1) + ix;
            face(n,5) = (iz-1)*(ntx+1)*(nty+1) + (nty)*(ntx+1) + ix;
        end
    end

    n = 0;
    for iy = 1:nty+1
        for ix = 1:ntx+1
            n = n+1;
            face(n,3) = (iy-1)*(ntx+1) + ix;
            face(n,6) = (ntz)*(ntx+1)*(nty+1) + (iy-1)*(ntx+1) + ix;
        end
    end
    
end