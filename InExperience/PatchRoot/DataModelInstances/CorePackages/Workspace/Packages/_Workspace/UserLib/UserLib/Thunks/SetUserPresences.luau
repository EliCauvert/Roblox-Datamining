local receiveUsersPresenceModule = require(script:FindFirstAncestor("UserLib").Utils.receiveUsersPresence)

return function(p0)
	-- upvalues: receiveUsersPresenceModule (ref)
	return function(p1)
		-- upvalues: receiveUsersPresenceModule (copy), p0 (ref)
		receiveUsersPresenceModule(p0, p1)
	end
end