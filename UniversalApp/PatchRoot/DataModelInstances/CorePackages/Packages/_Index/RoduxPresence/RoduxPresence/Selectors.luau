local getUserPresenceByUserIdModule = require(script.getUserPresenceByUserId)

return function(p0)
	-- upvalues: getUserPresenceByUserIdModule (ref)
	return {
		getUserPresenceByUserId = getUserPresenceByUserIdModule(p0)
	}
end