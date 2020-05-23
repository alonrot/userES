Description
=========
Vanilla Entropy Search synthetic example.

This repository is a high-level user interface to run [Entropy Search (ES)](http://www.jmlr.org/papers/volume13/hennig12a/hennig12a.pdf). The original code can be found [here](https://github.com/ProbabilisticNumerics/entropy-search).

	Philipp Hennig and Christian J Schuler,
	"Entropy Search for Information-Efficient Global Optimization", 
	The Journal of Machine Learning Research (JMLR),
	2012, accepted.

This code has been used to automatically tune parameters of a Linear Quadratic Regulator (LQR) for a robot arm to balance an inverted pole. See the associated publication [here](https://arxiv.org/abs/1605.01950).

	Alonso Marco, Philipp Hennig, Jeannette Bohg, Stefan Schaal, Sebastian Trimpe,
	"Automatic LQR Tuning Based on Gaussian Process Global Optimization", 
	IEEE 2016 International Conference on Robotics and Automation (ICRA),
	2020, accepted.


Requirements
============
This package needs the Entropy Search (ES) library, which can be found [here](https://github.com/alonrot/ESlib).
It works under Matlab 2017 or higher.

Execute an example
==================
Run the following script before starting the application
```Matlab
start_up
```
Then, run `run_ES` for an example.

