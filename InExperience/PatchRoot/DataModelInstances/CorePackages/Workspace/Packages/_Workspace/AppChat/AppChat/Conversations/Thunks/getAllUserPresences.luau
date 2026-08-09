local networkingPresenceModule = require(script:FindFirstAncestor("AppChat").Http.NetworkingPresence)

return function() --[[ line: 5 ]]
	-- upvalues: networkingPresenceModule (ref)
	return function(p0) --[[ line: 6 ]]
		-- upvalues: networkingPresenceModule (copy)
		local t = {}
		
		for i, v in pairs(p0:getState().Users) do
			if i ~= "-1" then
				table.insert(t, i)
			end
		end
		p0:dispatch(networkingPresenceModule.GetPresencesFromUserIds.API(t)):catch(function(p1) --[[ line: 17 ]]
			warn("NetworkingPresence failure in getAllUserPresences, Status: " .. tostring(p1))
		end)
	end
end