local ReceiveUsersPresenceModule = require(script:FindFirstAncestor("UserLib").Utils.receiveUsersPresence)

return function(p1) --[[ Line: 4 ]]
	-- upvalues: ReceiveUsersPresenceModule (copy)
	return function(p2) --[[ Line: 5 ]]
		-- upvalues: ReceiveUsersPresenceModule (upval), p1 (copy)
		ReceiveUsersPresenceModule(p1, p2)
	end
end