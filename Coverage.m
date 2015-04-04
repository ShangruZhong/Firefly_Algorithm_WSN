
% -----------------------------------------
% d-dimensional objective function
%% Put your own cost/objective function here --------%%%
%% Cost or Objective function

function z=Coverage(Solution,WSNpoint,R)
                     
CoverNum=0;   %???ǵĵ??
for Px=0:99                             %
    for Py=0:99                         
        for S=1:WSNpoint                  
            Distance=(Solution(1,S)-Px)^2+(Solution(2,S)-Py)^2;
            if(Distance<(R*R))                
                CoverNum=CoverNum+1;        
                break;                   
        end
    end
end
z=CoverNum/((99+1)^2);      %??㸲???