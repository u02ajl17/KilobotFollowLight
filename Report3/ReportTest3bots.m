
sim=remApi('remoteApi');
sim.simxFinish(-1); % just in case, close all opened connections
clientID=sim.simxStart('127.0.0.1',19999,true,true,5000,5);('remoteApi'); % using the prototype file (remoteApiProto.m)
sim.simxStartSimulation(clientID,sim.simx_opmode_streaming);
success = 0;
collision = 0;
test = 0;
if (clientID>-1)
    %sim.simxWriteStingStream(clientID,"begin","1",sim.simx_opmode_oneshot)
    	[returnCode]=sim.simxSetStringSignal(clientID,'begin',1,sim.simx_opmode_blocking);
        if (returnCode ~=0)
            disp("begin error code")
            disp(returnCode)
        else
            disp('begin message sent')
        end
        
    tic;
while (success == 0)
    [returnCode,begin]= sim.simxGetStringSignal(clientID,'begin',sim.simx_opmode_blocking);
    if (returnCode == 0)
        disp('begin signal')
        disp(begin)
    end
    [returnCode,test]= sim.simxGetStringSignal(clientID,'test',sim.simx_opmode_streaming);
   if (returnCode ==0)
        if (test == '0')
        %disp(test);
    else
        disp("success");
        
        
        [returnCode,battery]= sim.simxGetStringSignal(clientID,'battery',sim.simx_opmode_blocking);
        if (returnCode == 0)
            disp("battery is")
            disp(battery)
            time = toc;
            disp("time")
            disp(time)
            dlmwrite('batdata.txt',battery,'-append');
            dlmwrite('time.txt',time,'-append');
        else
            disp(returnCode)
        end
        [returnCode,battery2]= sim.simxGetStringSignal(clientID,'battery2',sim.simx_opmode_blocking);
        if (returnCode == 0)
            disp("battery2 is")
            disp(battery2)
        else
            disp(returnCode)
        end
         [returnCode,battery3]= sim.simxGetStringSignal(clientID,'battery3',sim.simx_opmode_blocking);
        if (returnCode == 0)
            disp("battery3 is")
            disp(battery3)
        else
            disp(returnCode)
        end
        
        success = 1;
        end
        
        
   elseif (returnCode ==8)
       disp('error in handle');
       
   end
   
end

end
