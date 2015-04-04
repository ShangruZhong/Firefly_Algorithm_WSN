clear;   

w=100;   %
d=100;   %dimensions of each solutions(firefly)
point=d;  %the point covered by WSN 100*100
r=7; %wsn?ĸ??ǰ뾶r=7
q=0;
% parameters [n N_iteration alpha betamin gamma]
para=[25 500 0.7 0.2 1];


Ub=ones(1,d).*w; %/*upper bounds of the parameters. */
Lb=zeros(1,d);   %/*lower bound of the parameters.*/

% Initial random guess
u0=(Lb+Ub)/2; 

[ux,uy,fval,NumEval,maxzn]=ffa_wsn(u0,Lb,Ub,para,q);


% Display results
draw(ux,uy,100,7)

bestsolutionx=ux
bestsolutiony=uy
bestojb=fval
total_number_of_function_evaluations=NumEval




%%% End of the part to be modified -------------------%%%

%%% --------------------------------------------------%%%
%%% Do not modify the following codes unless you want %%%
%%% to improve its performance etc                    %%%
% -------------------------------------------------------
% ===Start of the Firefly Algorithm Implementation ======
% Inputs: fhandle => @cost (your own cost function,
%                   can be an external file  )
%     nonhandle => @constraint, all nonlinear constraints
%                   can be an external file or a function
%         Lb = lower bounds/limits
%         Ub = upper bounds/limits
%   para == optional (to control the Firefly algorithm)
% Outputs: nbest   = the best solution found so far
%          fbest   = the best objective value
%      NumEval = number of evaluations: n*MaxGeneration
% Optional:
% The alpha can be reduced (as to reduce the randomness)
% ---------------------------------------------------------

