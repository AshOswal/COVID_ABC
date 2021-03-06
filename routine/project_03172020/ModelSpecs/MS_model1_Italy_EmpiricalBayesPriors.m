function [R p m uc] = MS_model1_Italy_EmpiricalBayesPriors(R)

%% Parameter Expectations
p.E0_par = -1.0289; % Initial Exposures
p.alpha = -1.5396; % protection rate
p.beta = -0.1597;  % infection rate
p.gamma = -0.5138; % inverse of average latent time
p.delta = 0.3717; % inverse of average quarantine time
p.lambda0 = -0.8154; % cure rate (time dependant)
p.kappa0 = -0.7703; % mortality rate (time dependant)
p.Npop = 0; % population of 60M
p.Q_Time = 0; %inverse of time until begining of quarantine measurements.[SEIQRDP_Q]

%% Parameter Precisions
p.E0_par_s = 1/8; % Initial Exposures
p.alpha_s = 1/32; % protection rate
p.beta_s = 1/32;  % infection rate
p.gamma_s = 1/32; % inverse of average latent time
p.delta_s = 1/32; % inverse of average quarantine time
p.lambda0_s = 1/32; % cure rate (time dependant)
p.kappa0_s = 1/32; % mortality rate (time dependant)
p.Npop_s = 0; % population of 60M
p.Q_Time_s = 1/4; %inverse of time until begining of quarantine measurements.[SEIQRDP_Q]

% Observer parameters
p.obs.LF = 0;

% Intial Conditions
E0 = 200; % Initial number of exposed
Q0 = 0; % Initial number of infectious that have been quanrantined
I0 = Q0; % Initial number of infectious cases non-quarantined
R0 = 0; % Initial number of recovereds
D0 = 1; % Initial number of deads
% Setup Vector
m.x(1) = E0;
m.x(2) = I0;
m.x(3) = Q0;
m.x(4) = R0;
m.x(5) = D0;
m.m = 1;
uc = nan;
