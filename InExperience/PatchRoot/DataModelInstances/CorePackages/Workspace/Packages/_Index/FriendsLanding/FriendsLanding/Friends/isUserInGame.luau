local presenceType = require(script:FindFirstAncestor("FriendsLanding").dependencies).RoduxPresence.Enums.PresenceType

return function(p1)
	-- upvalues: presenceType (ref)
	if not p1 then
		return false
	end
	local var1
	assert(p1, "user modal must be non-nil")
	
	if p1.userPresenceType == presenceType.InGame and p1.lastLocation then
		var1 = p1.lastLocation ~= ""
	end
	return var1
end