%
% Copyright 2017 Max Planck Society. All rights reserved.
% 
% Alonso Marco
% Max Planck Institute for Intelligent Systems
% Autonomous Motion Department
% amarco(at)tuebingen.mpg.de
%
function GP = initialize_GP(specs)

    % Create GP structure:
        GP = struct;
        
    % Covariance function:
        % GP.covfunc       = {@covRQard};
        % GP.covfunc_dx    = {@covRQard_dx_MD};
        GP.covfunc       = {@covSEard};
        GP.covfunc_dx    = {@covSEard_dx_MD};
        
        % Covariance hyperparameters (DIM):
            % Lengthscales:
            % ls = [0.1 0.2 0.3 0.1 0.2];
            % ls = [0.1 0.2];
            ls = 0.1;
            ls = reshape(ls,[length(ls),1]);

            % Prior standard deviation (the variance (std_s^2) is computed automatically within the kernel functions):
            std_s = 2.0;
                        
        % Parameter alpha for the RQ kernel:
            % alph = 0.5; % When running with RQ kernel
            % alph = []; % When running with SE kernel
        
        % Cov. function hyperparameters (in this order):
            % hyp.cov     = log([ls;std_s;alph]); 
            hyp.cov     = log([ls;std_s]); 
    
    % Likelihood function:
        GP.likfunc = @likGauss;
        std_n = 0.1;
        hyp.lik = log(std_n);
        
    % Mean function:
        GP.mean     = {@meanConst};
        GP.mean_dx  = {@meanConst_dx_MD};
        hyp.mean    = [0.0];

    % Include the hyperparameters:
        GP.hyp     	= hyp;
        
    % Empty set of initial evaluations:
        GP.x          = [];
        GP.y          = [];
        
    % Relevant variables:
        GP = add_relevant_variables(GP,specs);  
        
    % Smaller lengthscale, to update the best guesses list:
        [~,which_ell] = min([norm(ls)]);
        if which_ell == 1
            GP.l_small = ls;
        elseif which_ell == 2
            GP.l_small = le;
        end
        
end

function GP = add_relevant_variables(GP,specs)

    % Number of dimensions:
        GP.D        = specs.D;
        
	% Add a vector of test locations to plot in:
        GP.z_plot   = specs.z_plot;
        
    % Location of representer points:
        GP.z     	= specs.z;
        
    % Other variables needed for ES:
        GP.deriv    = specs.with_deriv;
        GP.res    	= 1;
        GP.poly  	= specs.poly;
        GP.log     	= specs.log;

end

