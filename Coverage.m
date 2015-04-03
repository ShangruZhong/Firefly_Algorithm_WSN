
% -----------------------------------------
% d-dimensional objective function
%% Put your own cost/objective function here --------%%%
%% Cost or Objective function

function z=Coverage(Solution,WSNpoint,R)
                     
CoverNum=0;   %覆盖的点数
for Px=0:99                             %
    for Py=0:99                         
        for S=1:WSNpoint                  
            Distance=(Solution(1,S)-Px)^2+(Solution(2,S)-Py)^2;
            if(Distance<(R*R))                %传感器和第（PX,PY）个点的距离在传感器感知半径内
                CoverNum=CoverNum+1;        %有传感器覆盖该点，覆盖点数加1
                break;                   %只要有一个传感器覆盖该点即跳出循环
            end 
        end
    end
end
z=CoverNum/((99+1)^2);      %计算覆盖率