if (substate == 0) then
           thevalue = get_ambient_light()
            --sim.addStatusbarMessage(sim.getScriptName(sim.handle_self).." distance is "..thevalue)
                --if (thevalue< 0.05) then
                    --substate = 3
                set_color(0,3,3)
                if (thevalue > theoldvalue)then
                    substate = leftorright
                    theoldvalue = thevalue
                    
                elseif(thevalue < theoldvalue)then
                    if (leftorright == 1) then
                        leftorright = 2
                    else
                        leftorright = 1
                    end
                    theoldvalue = thevalue
                    substate = leftorright
                end
           elseif (substate ==1) then --straight on
                --sim.addStatusbarMessage(sim.getScriptName(sim.handle_self).." sub2 ")
                set_motor(200,25)
                
                substate = 0
            elseif(substate ==2) then --turn right
                --sim.addStatusbarMessage(sim.getScriptName(sim.handle_self).." sub3 ")
                set_motor(25,200)
                substate = 0
            elseif(substate ==3)then
            end
