function [nxbest,nybest,fbest,NumEval,maxzn]...
           = ffa_wsn(u0, Lb, Ub, para,q)
%% Check input parameters (otherwise set as default values)
%if nargin<6, 
%para=[20 150 0.25 0.20 1];
%end
%if nargin<5, Ub=[]; end
%if nargin<4, Lb=[]; end
%if nargin<3,
%disp('Usuage: FA_wsn(u0,Lb,Ub,para)');
%end
% n=number of fireflies
% MaxGeneration=number of pseudo time steps
% ------------------------------------------------
% alpha=0.25;      % Randomness 0--1 (highly random)
% betamn=0.20;     % minimum value of beta
% gamma=1;         % Absorption coefficient
% ------------------------------------------------
% @author: Shangru Zhong
% @email: draco.mystack@gmail.com
% @date: 11/01/2013
% ==================================

%%
n = para(1);  
MaxGeneration = para(2);
alpha = para(3); 
betamin = para(4); 
gamma = para(5);
beta0 = 1; 
b = beta0-betamin;
NumEval = n*MaxGeneration;% Total number of function evaluations

% Check if the upper bound & lower bound are the same size
if length(Lb) ~=length(Ub),
    disp('Simple bounds/limits are improper!');
    return
end

% Calcualte dimension
d = length(u0);   

% Initial values of an array
zn = ones(n, 1);
% ------------------------------------------------
% generating the initial locations of n fireflies
[nsx, nsy, Lightn] = init_ffa(n, d, Lb, Ub, u0);

% Iterations or pseudo time marching
for iter = 1:MaxGeneration,     

disp(['Iteration iter = ', int2str(iter)]);

% Evaluate new solutions (for all n fireflies)
q = q + 1;
for i = 1:n
   Solution = [nsx(i,:);nsy(i,:)];   % matrix: 2*100
   zn(i) = coverage(Solution,100,7); % WSN coverage of solution i (with points 100 and radius 7)  
   Lightn(i) = zn(i);   
end
maxzn(q) = max(zn);
disp(['coverage of current solution: ', num2str(maxzn(q))])
% minzn(a)=min(zn)

%% Find the current best
nsxo = nsx; 
nsyo = nsy;
Lighto = Lightn;

% Move all fireflies to the better locations
[nsx,nsy] = ffa_move(n, nsx, nsy, Lightn, nsxo, nsyo, Lighto, alpha, betamin, gamma, b);%Lb,Ub);
      
end   % end of iterations 

% Ranking fireflies by their light intensity/objectives
[Lightn,Index] = sort(zn);
nsx_tmp = nsx;
nsy_tmp = nsy;
for i = 1:n,
 nsx(i,:) = nsx_tmp(Index(i), :);
 nsy(i,:) = nsy_tmp(Index(i), :);
end
 nxbest = nsx(n,:); 
 nybest = nsy(n,:);
 Lightbest = Lightn(n);
 fbest = Lightbest;
% Check if the updated solutions/locations are within limits
[nsx, nsy] = findlimits(n, nsx, nsy, Lb, Ub);


function alpha = alpha_new(alpha, NGen)
% alpha_n=alpha_0(1-delta)^NGen=0.005
% alpha_0=0.9
delta=1-(0.005/0.9)^(1/NGen);
alpha=(1-delta)*alpha;












