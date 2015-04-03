% ----- All the subfunctions are listed here ------------
%---------------------------------------------------------------------------------------------------------------
% The initial locations of n fireflies
function [nsx,nsy,Lightn]=init_ffa(n,d,Lb,Ub,u0)
Range = Ub-Lb;  %100
Lower = Lb;  %0
  % if there are bounds/limits,
if length(Lb)>0,
   for i=1:n,    %n=20,30
   nsx(i,:)=Lower+Range.*rand(1,d);     %---------x 20*d,20*100
   nsy(i,:)=Lower+Range.*rand(1,d);     %---------y 20*d,20*100  全部解组成的矩阵
   end
else
   % generate solutions around the random guess
   for i=1:n,
   nsx(i,:)=u0+randn(1,d);
   nsy(i,:)=u0+randn(1,d);
   end
end
% initial value before function evaluations
Lightn=ones(n,1);%*10^100;