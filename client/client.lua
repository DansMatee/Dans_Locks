local CoolDown = 0
local OpenPrompt
local PromptGroup = GetRandomIntInRange(0, 0xffffff)

function SetupOpenPrompt()
    Citizen.CreateThread(function()
        local str = 'Door'
        OpenPrompt = PromptRegisterBegin()
        PromptSetControlAction(OpenPrompt, Config.KeyPress)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(OpenPrompt, str)
        PromptSetEnabled(OpenPrompt, 1)
        PromptSetVisible(OpenPrompt, 1)
		PromptSetHoldMode(OpenPrompt, 1)
		PromptSetGroup(OpenPrompt, PromptGroup)
		PromptRegisterEnd(OpenPrompt)
    end)
end

Citizen.CreateThread(function()
    SetupOpenPrompt()
    while true do
        Citizen.Wait(1)
        local playerCoords, letSleep = GetEntityCoords(PlayerPedId()), true

        for k,doorID in ipairs(Config.DoorList) do
            local distance = #(playerCoords - doorID.doorCoords)

            local maxDistance, displayText = 1.25, 'unlocked'

            if doorID.distance then
                maxDistance = doorID.distance
            end

            if distance < 50 then
                letSleep = false

                if doorID.doors then
                    if doorID.locked then
                        for _,v in ipairs(doorID.doors) do
                            Citizen.InvokeNative(0xD99229FE93B46286, v.doorHash , 1, 0, 0, 0, 0, 0)
                            DoorSystemSetDoorState(v.doorHash, 1)
                        end
                    else
                        for _,v in ipairs(doorID.doors) do
                            Citizen.InvokeNative(0xD99229FE93B46286, v.doorHash , 1, 0, 0, 0, 0, 0)
                            DoorSystemSetDoorState(v.doorHash, 0)
                        end
                    end
                else
                    if doorID.locked then
                        Citizen.InvokeNative(0xD99229FE93B46286, doorID.doorHash , 1, 0, 0, 0, 0, 0)
                        DoorSystemSetDoorState(doorID.doorHash, 1)
                    else
                        Citizen.InvokeNative(0xD99229FE93B46286, doorID.doorHash , 1, 0, 0, 0, 0, 0)
                        DoorSystemSetDoorState(doorID.doorHash, 0)
                    end
                end
            end

            if distance < maxDistance then
                if distance < 1.75 then
                    if Config.UsePrompt then
                        if doorID.locked then
                            local label = CreateVarString(10, 'LITERAL_STRING', "Unlock")
                            PromptSetActiveGroupThisFrame(PromptGroup, label)
                            if PromptHasHoldModeCompleted(OpenPrompt) and CoolDown < 1 then
                                CoolDown = 1000
                                local state = not doorID.locked
                                TriggerServerEvent('dans_locks:server:updateState', GetPlayerServerId(), k, state)
                            end
                        else
                            local label = CreateVarString(10, 'LITERAL_STRING', "Lock")
                            PromptSetActiveGroupThisFrame(PromptGroup, label)
                            if PromptHasHoldModeCompleted(OpenPrompt) and CoolDown < 1 then
                                CoolDown = 1000
                                local state = not doorID.locked
                                TriggerServerEvent('dans_locks:server:updateState', GetPlayerServerId(), k, state)
                            end
                        end
                    else
                        if IsControlJustPressed(0, Config.KeyPress) and CoolDown < 1 then
                            CoolDown = 1000
                            local state = not doorID.locked            
                            TriggerServerEvent('dans_locks:server:updateState', GetPlayerServerId(), k, state)
                        end
                    end
                end
            end

            if CoolDown > 0 then
                CoolDown = CoolDown - 1
            end
        end

        if letSleep then
            Citizen.Wait(500)
        end
    end
end)

RegisterNetEvent('dans_locks:client:setState')
AddEventHandler('dans_locks:client:setState', function(doorID, state)

	Config.DoorList[doorID].locked = state

end)