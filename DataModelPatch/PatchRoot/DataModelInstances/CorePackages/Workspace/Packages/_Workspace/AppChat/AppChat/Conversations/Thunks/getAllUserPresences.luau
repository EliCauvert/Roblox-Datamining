local NetworkingPresenceModule = require(script:FindFirstAncestor("AppChat").Http.NetworkingPresence)

return function()
	-- upvalues: NetworkingPresenceModule (copy)
	return function(p1)
		-- upvalues: NetworkingPresenceModule (upval)
		local List = {}
		
		for i, _ in pairs(p1:getState().Users) do
			if i ~= "-1" then
				table.insert(List, i)
			end
		end
		p1:dispatch(NetworkingPresenceModule.GetPresencesFromUserIds.API(List)):catch(function(Err)
			warn("NetworkingPresence failure in getAllUserPresences, Status: " .. tostring(Err))
		end)
	end
end