local appChat = script:FindFirstAncestor("AppChat")
local networkingPresenceModule = require(appChat.Http.NetworkingPresence)

return if require(appChat.Flags.FFlagAppChatPresenceStoreMigration) then nil else function()
	-- upvalues: networkingPresenceModule (ref)
	return function(p1)
		-- upvalues: networkingPresenceModule (copy)
		local t = {}
		
		for i, v in pairs(p1:getState().Users) do
			if i ~= "-1" then
				table.insert(t, i)
			end
		end
		p1:dispatch(networkingPresenceModule.GetPresencesFromUserIds.API(t)):catch(function(p2)
			warn("NetworkingPresence failure in getAllUserPresences, Status: " .. tostring(p2))
		end)
	end
end