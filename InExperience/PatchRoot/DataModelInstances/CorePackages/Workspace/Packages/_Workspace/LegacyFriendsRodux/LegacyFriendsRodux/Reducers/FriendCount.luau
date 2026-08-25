local setFriendCount = require(script:FindFirstAncestor("LegacyFriendsRodux").Actions).SetFriendCount

return function(p0, p1)
	-- upvalues: setFriendCount (ref)
	return if p1.type == setFriendCount.name then p1.count else p0 or 0
end