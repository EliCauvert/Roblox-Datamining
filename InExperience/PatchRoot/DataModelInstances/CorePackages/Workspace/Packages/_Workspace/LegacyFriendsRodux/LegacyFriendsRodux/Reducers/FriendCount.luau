local setFriendCount = require(script:FindFirstAncestor("LegacyFriendsRodux").Actions).SetFriendCount

return function(p1, p2)
	-- upvalues: setFriendCount (ref)
	return if p2.type == setFriendCount.name then p2.count else p1 or 0
end