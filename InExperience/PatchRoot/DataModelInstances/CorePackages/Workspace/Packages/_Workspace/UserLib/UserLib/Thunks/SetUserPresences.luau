local receiveUsersPresenceModule = require(script:FindFirstAncestor("UserLib").Utils.receiveUsersPresence)

return function(p1)
	-- upvalues: receiveUsersPresenceModule (ref)
	return function(p2)
		-- upvalues: receiveUsersPresenceModule (copy), p1 (ref)
		receiveUsersPresenceModule(p1, p2)
	end
end