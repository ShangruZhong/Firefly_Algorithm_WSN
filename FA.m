%% Main Function
% @author: Shangru Zhong
% @email: draco.mystack@gmail.com
% @date: 11/01/2013
clc;
clear;   

%% Parameters Setting
w = 100;   
d = 100;   % dimensions of each solutions(firefly)
point = d;  %the sensor point covered by WSN 100*100
r = 7; % radius of sensor point coverage region in WSN
q = 0;
para = [25 5 0.7 0.2 1];% parameters [n N_iteration alpha betamin gamma]

Ub = ones(1,d).*w; %/*upper bounds of the parameters. */
Lb = zeros(1,d);   %/*lower bound of the parameters.*/

% Initial random guess
u0=(Lb+Ub)/2; 

%% Wireless Sensor Network Deployment using Fireflies Algorithm
[ux,uy,fval,NumEval,maxzn]=ffa_wsn(u0,Lb,Ub,para,q);

%% Results Visualization
draw(ux, uy, 100, 7)
bestsolutionx = ux;
bestsolutiony = uy;
bestojb = fval
total_number_of_function_evaluations = NumEval



