local AppChat = script:FindFirstAncestor("AppChat")
local NetworkingPresenceModule = require(AppChat.Http.NetworkingPresence)

return if require(AppChat.Flags.FFlagAppChatPresenceStoreMigration) then nil else function() --[[ Line: 8 ]]
	-- upvalues: NetworkingPresenceModule (copy)
	return function(p1) --[[ Line: 9 ]]
		-- upvalues: NetworkingPresenceModule (upval)
		local List = {}
		
		for i, _ in pairs(p1:getState().Users) do
			if i ~= "-1" then
				table.insert(List, i)
			end
		end
		p1:dispatch(NetworkingPresenceModule.GetPresencesFromUserIds.API(List)):catch(function(Err) --[[ Line: 20 ]]
			warn("NetworkingPresence failure in getAllUserPresences, Status: " .. tostring(Err))
		end)
	end
end