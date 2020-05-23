%
% Vanilla Entropy Search: run Entropy Search for a simple case using the
% Entropy Search library (ESlib)
%
% =========================================================================
% Entropy Search
%
% Copyright 2016 Max Planck Society. All rights reserved.
% 
% Alonso Marco
% Max Planck Institute for Intelligent Systems
% Autonomous Motion Department
% amarco(at)tuebingen.mpg.de


%% Initialization:
    close all; clear all; clc;
    
%% Prepare ES:
    specs = initialize_ES();
    
%% Run ES:
    out = EntropySearch(specs);

    