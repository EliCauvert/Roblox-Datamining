local PresenceType = require(script:FindFirstAncestor("FriendsLanding").dependencies).RoduxPresence.Enums.PresenceType

return function(p1): boolean --[[ Line: 11 ]]
	-- upvalues: PresenceType (copy)
	if p1 then
		assert(p1, "user modal must be non-nil")
		
		return if p1.userPresenceType == PresenceType.InGame and p1.lastLocation then p1.lastLocation ~= "" else false
	else
		return false
	end
end