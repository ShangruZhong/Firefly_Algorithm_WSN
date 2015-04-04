
% Move all fireflies toward brighter ones
function [nsx,nsy]=ffa_move(n,nsx,nsy,Lightn,nsxo,nsyo,Lighto,alpha,betamin,gamma,b)%Lb,Ub)
            % nxbest,nybest,Lightbest,!!!!!!!d!!!!!!!!!!!!!!!!
         
% Scaling of the system
%scale=abs(Ub-Lb);

% Updating fireflies
for i=1:n,
% The attractiveness parameter beta=exp(-gamma*r)
   for j=1:n,
  
    k=randint(1,1,[1,100]);
	l=randint(1,1,[1,100]);
	rx=abs(nsx(i,k)-nsx(j,l));
	ry=abs(nsy(i,k)-nsy(j,l)); 
	rx1=abs(nsx(i,l)-nsx(j,k));
	ry1=abs(nsy(i,l)-nsy(j,k));
	
     % r=sqrt(sum((nsx(i,:)-nsx(j,:)).^2)+(nsy(i,:)-nsy(j,:)).^2);  %r^2=||xi-xj||^2+||yi-yj||^2
	  % Update moves
	if Lightn(i)<Lighto(j), % Brighter and more attractive
  
   %beta0=1; 
   %beta=(beta0-betamin)*exp(-gamma*r.^2)+betamin; 
   %b=beta0-betamin!!!!!!!!!!!!!!!!!!!!
   
   betax=b*exp(-gamma*rx.^2)+betamin; 
   betay=b*exp(-gamma*ry.^2)+betamin;
   
   betax1=b*exp(-gamma*rx1.^2)+betamin; 
   betay1=b*exp(-gamma*ry1.^2)+betamin;
   
  % tmpf=alpha.*(rand(1,d)-0.5).*scale;
   tmpf=alpha.*(rand(1,1)-0.5);%.*scale;   %tmpf:1*100
   nsx(i,k)=nsx(i,k).*(1-betax)+nsxo(j,l).*betax+tmpf;
   nsy(i,k)=nsy(i,k).*(1-betay)+nsyo(j,l).*betay+tmpf;
   
   nsx(i,l)=nsx(i,l).*(1-betax1)+nsxo(j,k).*betax+tmpf;
   nsy(i,l)=nsy(i,l).*(1-betay1)+nsyo(j,k).*betay+tmpf;
   %ns(i,:)=ns(i,:).*(1-beta)+nsyo(j,:).*beta+tmpf;
   
   Solution_temp=[nsx(i,:);nsy(i,:)];   
   Lightn_temp=Coverage(Solution_temp,100,7);
   
   if Lightn_temp<Lightn(i)  %lightness didn't be improved
      nsx(i,:)=nsxo(i,:);
	  nsy(i,:)=nsyo(i,:);
	  
   else Lightn(i)=Lightn_temp;
       Lighto(i)=Lightn(i);
	 end
	end
   end % end for j

end % end for i
