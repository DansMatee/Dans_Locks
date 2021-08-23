local DoorInfo = {}

RegisterServerEvent('dans_locks:server:updateState')
AddEventHandler('dans_locks:server:updateState', function(source, doorID, state, cb)
    local _source = source
    TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
        if type(doorID) ~= 'number' then
            return
        end
        if not IsAuthorized(user.getJob(), Config.DoorList[doorID]) then
            return
        end
        DoorInfo[doorID] = {}
        TriggerClientEvent('dans_locks:client:setState', -1, doorID, state)
    end)
end)



function IsAuthorized(jobName, doorID)
	for _,job in pairs(doorID.AuthJob) do
		if job == jobName then
			return true
		end
	end
	return false
end