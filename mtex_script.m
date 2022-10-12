close all
clear
clc

%% Import Script for EBSD Data
%
% This script was automatically created by the import wizard. You should
% run the whoole script or parts of it in order to import your data. There
% is no problem in making any changes to this script.

%% Specify Crystal and Specimen Symmetries

% crystal symmetry
CS = {... 
  'notIndexed',...
  crystalSymmetry('m-3m', [4 4 4], 'mineral', 'Aluminum'),...
  'notIndexed'};

% plotting convention
setMTEXpref('xAxisDirection','east');
setMTEXpref('zAxisDirection','outOfPlane');

pfAnnotations = @(varargin) text([vector3d.X,vector3d.Y],{'X', 'Y'},...
  'BackgroundColor','w','tag','axesLabels',varargin{:});
setMTEXpref('pfAnnotations',pfAnnotations);

%% Specify File Names

% path to files
pname = pwd;

% which files to be imported
% fname = [pname '/fitted.txt'];
fname = [pname '/EBSD_125000'];

%% Import the Data

% create an EBSD variable containing the data
ebsd = EBSD.load(fname,CS,'interface','generic',...
  'ColumnNames', { 'x' 'y' 'z' 'phi1' 'Phi' 'phi2'}, 'Columns', [1 2 3 4 5 6], 'Bunge', 'Radians');

ebsds = ebsd('Aluminum');
ipfKey = ipfTSLKey(ebsd);
colored_orientations = ipfKey.orientation2color(ebsd.orientations);

figure(1);
plot(ebsd, colored_orientations, 'coordinates', 'on');
set(gcf, 'Position', [34 199 479 748])
drawnow

% % Plot pole figure
figure(2);
CS = ebsd('Aluminum').CS;
h = [Miller(1,0,0,CS),Miller(1,1,0,CS),Miller(1,1,1,CS)];
psi = deLaValleePoussinKernel('halfwidth',5*degree);
odf = calcODF(ebsd('Aluminum').orientations,'kernal',psi);
plotPDF(odf,h,'antipodal','silent','minmax','on','colorrange','equal')
mtexColorbar(jet)
set(gcf, 'Position', [514 747 570 200])
drawnow

% %     figure(3)
% %     r = rotation('axis', xvector,'angle',90*degree);
% %     odf = rotate(odf,r);      
% %     plotPDF(odf,h,'antipodal','silent','minmax','on','colorrange','equal')
% %     mtexColorbar(jet)
% %     set(gcf, 'Position', [514 199 570 200])
% %     drawnow