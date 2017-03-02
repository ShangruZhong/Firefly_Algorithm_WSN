function z = coverage(Solution, WSNpoint, R)
%% Put your own cost/objective function here 
% so called Cost or Objective function, fitness function, etc.
% in WSN, objective function should be the total coverage of whole network
% @author: Shangru Zhong
% @email: draco.mystack@gmail.com
% @date: 11/01/2013

CoverNum = 0;   
for Px = 0:99                             
    for Py = 0:99                         
        for S = 1:WSNpoint                  
            Distance = (Solution(1,S)-Px)^2 + (Solution(2,S)-Py)^2;
            if(Distance < (R*R))                
                CoverNum = CoverNum + 1;        
                break;                   
        end
    end
    end
end
z=CoverNum/((99+1)^2);     % calculate coverage rate