close all
clear all
clc

%% INITIALIZATION
% Graphics state
scale_s     = 1;          % Scale
rotation_th = 0;          % Orientation
mirror_x = false;         % Mirroring X axis
mirror_y = false;         % Mirroring Y axis
% Standard circle aperture
AB_D10 = [-2.500 1.000];  % Position D10 on AB local coordinate frame
% Flash positions of the aperture blocks (mm)
D03_AB_A = [0.000 0.000];
D03_AB_B = [0.000 6.000];
D03_AB_C = [7.000 6.000];
D03_AB_D = [7.000 0.000];

%% FUNCTIONS
mirror = @(P,mx,my) [ P(1) * (~mx) - P(1) * mx ...
                      P(2) * (~my) - P(2) * my ];
rotation = @(P,th) P * [  cos(th) sin(th) ; ...
                         -sin(th) cos(th) ];
scale = @(P,s) P * s;
dist = @(P1,P2) sqrt(sum((P1-P2).^2));

%% COMPUTE GROUND-TRUTH POSITIONS OF D10 IN GERBER COORDINATE FRAME
% Point A
D03_AB_A_D10 = D03_AB_A + AB_D10

% Point B
mirror_x = false;
mirror_y = true;
rotation_th = deg2rad(30);
scale_s = 1.0;

D03_AB_B_D10 = AB_D10;
D03_AB_B_D10 = mirror(D03_AB_B_D10,mirror_x,mirror_y);
D03_AB_B_D10 = rotation(D03_AB_B_D10,rotation_th);
D03_AB_B_D10 = scale(D03_AB_B_D10,scale_s);

D03_AB_B_D10 = D03_AB_B + D03_AB_B_D10

% Point C
mirror_x = true;
mirror_y = true;
rotation_th = deg2rad(45);
scale_s = 0.8;

D03_AB_C_D10 = AB_D10;
D03_AB_C_D10 = mirror(D03_AB_C_D10,mirror_x,mirror_y);
D03_AB_C_D10 = rotation(D03_AB_C_D10,rotation_th);
D03_AB_C_D10 = scale(D03_AB_C_D10,scale_s);

D03_AB_C_D10 = D03_AB_C + D03_AB_C_D10

% Point D
mirror_x = true;
mirror_y = false;
rotation_th = 0;
scale_s = 1;

D03_AB_D_D10 = AB_D10;
D03_AB_D_D10 = mirror(D03_AB_D_D10,mirror_x,mirror_y);
D03_AB_D_D10 = rotation(D03_AB_D_D10,rotation_th);
D03_AB_D_D10 = scale(D03_AB_D_D10,scale_s);

D03_AB_D_D10 = D03_AB_D + D03_AB_D_D10
