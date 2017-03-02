function draw(sx,sy,SensorNum,R)
%% Visualize the best solution of deployment of WSN
% @author: Shangru Zhong
% @email: draco.mystack@gmail.com
% @date: 11/01/2013

alpha1=0:pi/50:2*pi;                   
xp=sx(:,1);                        
yp=sy(:,2);                      

hold on;

for Pxy=1:SensorNum                 
    x=sx(Pxy)+R*cos(alpha1);
    y=sy(Pxy)+R*sin(alpha1);
    %plot(x,y,'-');
    fill(x,y,'b','facealpha',0.3);
end;
plot(xp,yp,'k.');                     
axis equal
axis([0 100 0 100])
hold off;