
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
        [returnCode,battery4]= sim.simxGetStringSignal(clientID,'battery4',sim.simx_opmode_blocking);
        if (returnCode == 0)
            disp("battery4 is")
            disp(battery4)
        else
            disp(returnCode)
        end
        
        [returnCode,battery5]= sim.simxGetStringSignal(clientID,'battery5',sim.simx_opmode_blocking);
        if (returnCode == 0)
            disp("battery5 is")
            disp(battery5)
        else
            disp(returnCode)
        end
        
         [returnCode,battery6]= sim.simxGetStringSignal(clientID,'battery6',sim.simx_opmode_blocking);
        if (returnCode == 0)
            disp("battery6 is")
            disp(battery6)
        else
            disp(returnCode)
        end
        
         [returnCode,battery7]= sim.simxGetStringSignal(clientID,'battery7',sim.simx_opmode_blocking);
        if (returnCode == 0)
            disp("battery7 is")
            disp(battery7)
        else
            disp(returnCode)
        end
        
        [returnCode,battery8]= sim.simxGetStringSignal(clientID,'battery8',sim.simx_opmode_blocking);
        if (returnCode == 0)
            disp("battery8 is")
            disp(battery8)
        else
            disp(returnCode)
        end
        
        [returnCode,battery9]= sim.simxGetStringSignal(clientID,'battery9',sim.simx_opmode_blocking);
        if (returnCode == 0)
            disp("battery9 is")
            disp(battery9)
        else
            disp(returnCode)
        end
        
        [returnCode,battery10]= sim.simxGetStringSignal(clientID,'battery10',sim.simx_opmode_blocking);
        if (returnCode == 0)
            disp("battery10 is")
            disp(battery10)
        else
            disp(returnCode)
        end
        
        success = 1;
         batteries = {battery battery2 battery3 battery4 battery5 battery6 battery7 battery8 battery9 battery10};
      xlswrite('test.xlsx',batteries)
        end
        
       elseif (returnCode ==8)
       disp('error in handle');
       
   end
   
end

end
