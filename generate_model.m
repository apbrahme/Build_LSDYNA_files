%clear; clc; close all;
function y = generate_model_3D(fname,dir,dim,fsig)

addpath('./main')

%% INITIALIZE
% NT: number of elements per side
% A:  length per side
% ntx = 50;
% nty = 50;
% ntz = 50;
ntx = dim;
nty = dim;
ntz = dim;
ax = 1.0;
ay = 1.0;
az = 1.0;

% Define folder name (to generate)
FOLDER = dir;%'test';

% Define texture to use
TEXTURE = fname;%'PF_8000';

% Failure stress (von-mises)
%fsig = 500;


%% COPY base files 
make_dir(FOLDER);
base_dir = 'main/copyfiles';
copyfile(fullfile(base_dir,'csv'),fullfile(FOLDER,'csv'))


%% GENERATE a rectangular prism mesh based on geometry defined above
[nnode, nelm, coord, conn, face] = grid_box(ntx, nty, ntz, ax, ay, az);
% fig = plot_nodes(nelm, conn, coord);   % ENABLE to plot mesh (may take a moment)


%% READ in the crystal file
crystals = read_crystals(TEXTURE);


%% RVE type FE model.
% Each element has a different crystal orientation. Each integration point
% has the same INITIAL properties as the element but will diverge as
% simulation progresses
    
% Generate LS-Dyna files and periodic constraints
write_keyfiles(FOLDER, nnode, nelm, coord, conn, face, crystals, 1)
write_csf(FOLDER, face)

% Write material file
write_umat_RVE_CP(FOLDER, crystals)
write_erosion_eps(FOLDER, crystals, fsig)

% Write simulation files
copyfile(fullfile(base_dir,'RVE_CP'),FOLDER)
    
end




