%% ============================================================
%  Plot any EPANET water distribution network
%  Works with the EPANET-MATLAB Toolkit
% ============================================================

clear; close all; clc;

%% 1. Start the toolkit (required)
start_toolkit;          % adds the toolkit functions to the path

%% 2. Load any EPANET network (.inp file)
% Change this path to your own network file
inpFile = 'Net1.inp';   % <-- replace with your .inp file

% Create the EPANET object
d = epanet(inpFile);

%% 3. Basic network information (optional but useful)
fprintf('Network loaded successfully!\n');
fprintf('Number of nodes : %d\n', d.getNodeCount);
fprintf('Number of links : %d\n', d.getLinkCount);
fprintf('Number of tanks : %d\n', d.getNodeTankCount);
fprintf('Number of reservoirs : %d\n', d.getNodeReservoirCount);
fprintf('Number of pumps : %d\n', d.getLinkPumpCount);
fprintf('Number of valves : %d\n', d.getLinkValveCount);

%% 4. Draw the network sketch
figure('Name', ['EPANET Network: ' inpFile], ...
       'Color', 'w', 'Position', [100 100 900 700]);

% Main plot command – this draws the complete network topology
d.plot;

% Optional enhancements (uncomment what you like):
% d.plot('highlightnode', {'10','11'});          % highlight specific nodes
% d.plot('highlightlink', {'10','11'});          % highlight specific pipes
% d.plot('fontsize', 9);                         % change font size of labels
% d.plot('nodes', 'yes', 'links', 'yes');        % force show nodes & links
% d.plot('nodeindex', 'yes');                    % show node indices
% d.plot('linkindex', 'yes');                    % show link indices

title(['Water Piping Network – ' inpFile], 'FontSize', 14, 'FontWeight', 'bold');
xlabel('X Coordinate');
ylabel('Y Coordinate');
axis equal;
grid on;

%% 5. Alternative plots (optional)

% Plot with flow directions (after a hydraulic run)
% d.solveCompleteHydraulics;   % run hydraulics first
% figure; d.plotDiGraph;       % shows arrows for flow direction

% Simple graph representation
% figure; d.plotGraph;

%% 6. Clean up
d.unload;   % close the EPANET library and free memory

disp('Network sketch completed successfully!');