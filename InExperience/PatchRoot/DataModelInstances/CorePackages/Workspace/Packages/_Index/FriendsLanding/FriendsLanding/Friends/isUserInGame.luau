local presenceType = require(script:FindFirstAncestor("FriendsLanding").dependencies).RoduxPresence.Enums.PresenceType

return function(p0)
	-- upvalues: presenceType (ref)
	if not p0 then
		return false
	end
	local var0
	assert(p0, "user modal must be non-nil")
	
	if p0.userPresenceType == presenceType.InGame and p0.lastLocation then
		var0 = p0.lastLocation ~= ""
	end
	return var0
end