Copyright 2017 Max Planck Society. All rights reserved.

Alonso Marco
Max Planck Institute for Intelligent Systems
Autonomous Motion Department
amarco(at)tuebingen.mpg.de

----

Vanilla Entropy Search synthetic example

Instructions
============
	+ Add the path to the library ESlib permanently in your matlab path. Yo can do that by running the next commands:
			>> addpath '/full/path/to/ESlib/'
			>> savepath
	+ Call the function start_up() from the MATLAB promt. This adds relevants paths to your MATLAB session, 
	 and attempts to compile some c++ functions in order to speed up the code execution. If the compilation
	 does not suceed, the matlab version of those functions (computationally less efficient) will be executed.
	+ Several options can be chosen by the user in initialize_ES() and initialize_GP() (see "Remarks").
	+ Run the script run_ES.m and wait for the search to finish.
	+ Results are saved automatically under results/vanES_YYYY-M-D-m/ each time the script run_ES.m is called. 
		If the exploration is stopped by the user (e.g., with Ctr+C), the current status of the exploration can be 
		checked by loading currentESstatus.mat.

Remarks
=======
	+ Change the input dimension (keyword DIM, in the code):
	  + Change the input domain limits in initialize_ES().
	  + Change the lengthscales and prior standard deviation in initialize_GP().
	+ At the moment, ES runs with squared exponential (SE) kernel and or rational quadratic (RQ) kernel.
		The corresponding functions are covSEard, covSEard_dx_MD, and covRQard,covRQard_dx_MD, respectively.
	+ The color code for the Gaussian process plots is:
		Red dots: 	collected data
		Black dot: 	Current estimate of the global minimum
		In 1D:
			Red line: 								posterior GP mean
			Red transparent surface: 	+- two standard deviations, computed out of the posterior GP variance.
			Dashed line: 							true function
		In 2D:
			Violet surface:							posterior GP mean
			Grey transparent surface: 	+- two standard deviations, computed out of the posterior GP variance.
	+ The output structure (out) contains several relevant fields:
		out.FunEst: estimate of the location of the global minimum at each iteration
		out.GPs{k}, being k the desired iteration number: useful information related to the utilized Gaussian 
		process model, for example:
		out.GPs{k}.x: location of the collected data points
		out.GPs{k}.y: value of the collected data points
		out.GPs{k}.z_plot: locations where the posterior mean and std are calculated to be plotted.

Contact information
===================
For any questions, please, send an e-mail to: 

   alonso.marco@tuebingen.mpg.de
