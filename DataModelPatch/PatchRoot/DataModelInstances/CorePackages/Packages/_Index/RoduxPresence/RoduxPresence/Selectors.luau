local GetUserPresenceByUserIdModule = require(script.getUserPresenceByUserId)

return function(p1)
	-- upvalues: GetUserPresenceByUserIdModule (copy)
	return {
		getUserPresenceByUserId = GetUserPresenceByUserIdModule(p1)
	}
end