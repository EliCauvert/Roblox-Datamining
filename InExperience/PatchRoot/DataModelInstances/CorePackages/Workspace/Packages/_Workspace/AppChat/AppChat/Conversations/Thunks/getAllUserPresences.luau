local appChat = script:FindFirstAncestor("AppChat")
local networkingPresenceModule = require(appChat.Http.NetworkingPresence)

return if require(appChat.Flags.FFlagAppChatPresenceStoreMigration) then nil else function() --[[ line: 8 ]]
	-- upvalues: networkingPresenceModule (ref)
	return function(p0) --[[ line: 9 ]]
		-- upvalues: networkingPresenceModule (copy)
		local t = {}
		
		for i, v in pairs(p0:getState().Users) do
			if i ~= "-1" then
				table.insert(t, i)
			end
		end
		p0:dispatch(networkingPresenceModule.GetPresencesFromUserIds.API(t)):catch(function(p1) --[[ line: 20 ]]
			warn("NetworkingPresence failure in getAllUserPresences, Status: " .. tostring(p1))
		end)
	end
end