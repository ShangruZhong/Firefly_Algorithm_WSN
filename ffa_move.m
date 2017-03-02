function [nsx,nsy] = ffa_move(n, nsx, nsy, Lightn, nsxo, nsyo, Lighto, alpha, betamin, gamma, b)
%% Move all fireflies toward brighter ones
% optional extra parameters: (Lb, Ub, nxbest, nybest,Lightbest) 
% Note:
% the ways of updating solution are strongly encouraged to overwrite,
% because the original one is time consuming,
% a simple way is to update solution randomly,
% but ensure the new coverage after updated should be better,
% otherwise, do not update 
%
% @atuhor: Shangru Zhong
% @email: draco.mystack@gmail.com
% @date: 11/01/2013
% ==================================

%%
% Scaling of the system
% scale=abs(Ub-Lb);

% Updating fireflies
for i = 1:n,
% The attractiveness parameter beta=exp(-gamma*r)
   for j = 1:n,
  
    k = randi([1, 100],1,1);
	l = randi([1, 100],1,1);
	rx = abs(nsx(i,k) - nsx(j,l));
	ry = abs(nsy(i,k) - nsy(j,l)); 
	
	rx1 = abs(nsx(i,l) - nsx(j,k));
	ry1 = abs(nsy(i,l) - nsy(j,k));
	
   % r=sqrt(sum((nsx(i,:)-nsx(j,:)).^2)+(nsy(i,:)-nsy(j,:)).^2);  %r^2=||xi-xj||^2+||yi-yj||^2
   % Update moves
    
   if Lightn(i) < Lighto(j), % Brighter and more attractive
  
   % ================= original ==========================
   % beta0 = 1; 
   % beta = (beta0 - betamin)*exp(-gamma*r.^2) + betamin; 
   % b = beta0 - betamin
   % ====================================================

   %% Update Solution
   % TODO: NEED TO BE REPLACED WITH OTHER UPDATE METHOD
   betax = b*exp(-gamma*rx.^2) + betamin; 
   betay = b*exp(-gamma*ry.^2) + betamin;
   
   betax1 = b*exp(-gamma*rx1.^2) + betamin; 
   betay1 = b*exp(-gamma*ry1.^2) + betamin;
  
   tmpf = alpha.*(rand(1,1) - 0.5);%.*scale; 
   nsx(i,k) = nsx(i,k).*(1-betax) + nsxo(j,l).*betax + tmpf;
   nsy(i,k) = nsy(i,k).*(1-betay) + nsyo(j,l).*betay + tmpf;
   
   nsx(i,l) = nsx(i,l).*(1-betax1) + nsxo(j,k).*betax + tmpf;
   nsy(i,l) = nsy(i,l).*(1-betay1) + nsyo(j,k).*betay + tmpf;
   
   Solution_temp = [nsx(i,:);nsy(i,:)];   
   Lightn_temp = coverage(Solution_temp,100,7);
   
   if Lightn_temp < Lightn(i)  %lightness didn't be improved
      nsx(i,:) = nsxo(i,:);
	  nsy(i,:) = nsyo(i,:);
	  
   else Lightn(i) = Lightn_temp;
       Lighto(i) = Lightn(i);
	 end
	end
   end % end for j
end % end for i
