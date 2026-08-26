local getUserPresenceByUserIdModule = require(script.getUserPresenceByUserId)

return function(p1)
	-- upvalues: getUserPresenceByUserIdModule (ref)
	return {
		getUserPresenceByUserId = getUserPresenceByUserIdModule(p1)
	}
end