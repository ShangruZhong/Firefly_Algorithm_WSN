function draw(sx,sy,SensorNum,R)

alpha1=0:pi/50:2*pi;                    %环绕传感器的圆周划分?00等分
xp=sx(:,1);                        %传感器x轴坐?
yp=sy(:,2);                        %y轴坐?

hold on;

for Pxy=1:SensorNum                    %画结点的作用范围—?点外????
    x=sx(Pxy)+R*cos(alpha1);
    y=sy(Pxy)+R*sin(alpha1);
    %plot(x,y,'-');
    fill(x,y,'b','facealpha',0.3);
end;
plot(xp,yp,'k.');                        %画点
axis equal
axis([0 100 0 100])
hold off;